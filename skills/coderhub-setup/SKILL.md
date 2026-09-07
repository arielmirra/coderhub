---
name: coderhub-setup
description: Onboarding inicial del cliente CoderHub. Llena profile.md automáticamente extrayendo datos de la transcripción de la call de discovery con el equipo de CoderHub, del CV del cliente, o de su perfil de LinkedIn. Es la primera skill que cualquier cliente nuevo tiene que correr — el resto de las skills (linkedin-profile-optimizer, linkedin-feed-job-hunter, cv-builder, etc.) leen el profile que esta skill genera. Triggers on "/coderhub-setup", "configurar mi perfil", "setup inicial", "arrancar con CoderHub", "primera vez que uso esto". Usa solo herramientas de read y write — no manda emails, no toca LinkedIn, no posta nada. La salida es un único archivo: ~/.coderhub/profile.md actualizado con todos los datos del cliente.
---

# CoderHub Setup

Primera skill que corre el alumno después de instalar el plugin de CoderHub. Llena `~/.coderhub/profile.md` con sus datos para que las otras skills (LinkedIn optimizer, feed apply, cv-builder, etc.) sepan quién es.

## Outcome

- `~/.coderhub/profile.md` lleno con todos los campos del schema (`${CLAUDE_PLUGIN_ROOT}/shared/profile-schema.md`)
- El cliente confirma cada bloque antes de guardar
- Una sola corrida resuelve todo el onboarding (sin micro-preguntas dispersas en el tiempo)

---

## Step 0 — Preparar el home del perfil

El perfil del alumno vive en `~/.coderhub/profile.md` — un home fijo, independiente del directorio donde el alumno abra Claude Code, que sobrevive a los updates del plugin. Ahí también van sus outputs (CV generado, logs).

**Antes de todo:**

1. Asegurar que el directorio exista:

   ```bash
   mkdir -p ~/.coderhub
   ```

2. Si `~/.coderhub/profile.md` **NO existe**, crearlo copiando el template en blanco que viene con el plugin:

   ```bash
   cp "${CLAUDE_PLUGIN_ROOT}/profile-template/profile.md" ~/.coderhub/profile.md
   ```

3. Si `~/.coderhub/profile.md` **ya existe** con datos cargados, avisar al alumno que ya tiene perfil y preguntar si quiere actualizarlo o empezar de cero.

> El template en `${CLAUDE_PLUGIN_ROOT}/profile-template/profile.md` NUNCA se modifica — es la plantilla en blanco reutilizable que trae el plugin. Todo lo del alumno vive en `~/.coderhub/profile.md` (local a su máquina, nunca se sube a ningún lado).

---

## Step 1 — Detectar input disponible

Preguntar al cliente **en un solo bloque** qué tiene a mano (puede combinar varias):

```
¿Qué fuentes de datos tenés disponibles para llenar el perfil?

1. 📞 Transcripción de tu call de discovery con CoderHub (lo más rico — sale Fathom o equivalente)
2. 📄 CV en texto / PDF
3. 🔗 URL de tu LinkedIn (tengo que poder leerla)
4. 🐙 Tu usuario de GitHub (lo traigo solo, gratis, sin configurar nada)
5. ✍️ Te respondo a mano (te hago preguntas y vamos llenando)

Tirame las que tengas. Cuantas más, mejor — combino todo.
```

**Prioridad de extracción cuando hay múltiples fuentes:**

| Bloque del profile | Fuente preferida |
|---|---|
| Identidad (nombre, email, etc.) | LinkedIn > CV > preguntas |
| Ubicación + legales | LinkedIn > CV > call > preguntas |
| Idiomas | call > LinkedIn > CV > preguntas |
| Rol actual + experiencia | LinkedIn > CV > call |
| Stack técnico | CV > LinkedIn > call |
| Logros concretos (con números) | **call** > CV > LinkedIn |
| Objetivo de búsqueda + banda salarial | **call** > preguntas |
| Modo confidencialidad | **call** > preguntas |
| Bloqueos diagnosticados | **call** (único origen real) |
| Anti-distracciones | **call** (único origen real) |
| Mentor asignado | **call** > preguntas |

**Regla:** los bloques marcados como `**call**` son los que justifican que el cliente saque la transcripción. Si no la tiene, hay que preguntarlos a mano — no inventar.

---

## Step 2 — Procesar inputs

### Si hay transcripción de call

1. Leer entera (no resumir antes de procesar).
2. Extraer literal:
   - Salario actual mencionado
   - Banda salarial objetivo (piso, realista, stretch — buscar las palabras "piso", "stretch", "realista", "conservador", "$XK")
   - Stack técnico mencionado
   - Logros con números (ej. "reduje 70% costos", "12 días", "100k usuarios")
   - **Bloqueos diagnosticados** — el equipo de CoderHub suele decir cosas tipo "tu problema NO es X, es Y" o "el bottleneck es Z". Capturar esas frases textuales si se puede.
   - **Anti-distracciones** — frases tipo "no te distraigas con X", "no necesitás aprender Y primero". Capturar textuales.
   - Modo confidencialidad — buscar menciones de "mi empresa actual no debe saber", "estoy empleado", "renuncié hace X meses".
   - Coach asignado — Cami suele aparecer mencionada.

3. Si la transcripción es de Fathom y tiene timestamps, **conservar el link al meeting** en la sección "Bloqueos diagnosticados" para trazabilidad (formato: `(ver call: https://fathom.video/calls/...)`).

### Si hay CV (texto o PDF)

1. Si es PDF, leerlo con la herramienta de lectura disponible.
2. Extraer:
   - Datos personales del header
   - Educación
   - Experiencia laboral (rol, empresa, fechas, descripciones)
   - Stack técnico (de la sección "Skills" o equivalente)
   - Logros si están cuantificados
3. Si el CV está en inglés y el cliente vive en LATAM, no traducir — guardar tal cual.

### Si hay URL de LinkedIn

1. Si hay MCP de LinkedIn disponible o se puede fetch la URL pública, extraer:
   - Headline
   - About / Acerca de
   - Experience
   - Skills (si son visibles)
   - Education
2. Si no se puede acceder programáticamente, pedir al cliente que copie y pegue el contenido de cada sección.

> **Nota Apify:** LinkedIn es la única fuente que necesita un scraper (Apify o un MCP de LinkedIn). Si el alumno no lo tiene configurado, NO bloquear — pedirle que pegue el contenido o pase el CV. El scraper es un plus, no un requisito.

### Si hay usuario de GitHub

GitHub es fuente **gratis y sin setup** — se trae con la API pública, sin Apify. Cualquier alumno con el CLI `gh` (o vía REST pública) puede. Traé lo básico:

```bash
gh api users/{usuario} --jq '"desde \(.created_at[0:10]) · repos:\(.public_repos) · followers:\(.followers)"'
```

**Extraé ESTRATÉGICAMENTE según seniority — no dumpear repos.** Para un perfil **Senior/Lead**, lo que importa de GitHub es:
- **Longevidad demostrable:** año de la cuenta / primera actividad → "programando desde {año} (~N años)". Es el señal más fuerte y el más subestimado.
- **Actividad constante:** pushes recientes ("sigue construyendo, no está oxidado").
- **Señales sociales:** followers si son notables.
- **Solo 1-2 proyectos realmente destacables** (con estrellas, un producto real, o algo relevante al rol target). Si no hay ninguno standout, no forzar — el valor es longevidad + constancia, no el catálogo.

**Nunca** listar sandboxes de aprendizaje ni repos triviales: para senior restan (señalizan junior) y alargan el CV al pedo. Para junior/semi, ahí sí un proyecto propio bien hecho puede sumar.

### Si solo hay respuestas a mano

Hacer preguntas en bloques temáticos (no una por una):

**Bloque 1 — Identidad y ubicación:**
> "Tirame en un mensaje: nombre completo, email, WhatsApp con código de país, URL de LinkedIn, país y ciudad donde vivís, nacionalidad, y si querés trabajar remoto / híbrido / presencial."

**Bloque 2 — Rol y experiencia:**
> "Cuál es tu rol actual y la empresa, hace cuántos años trabajás en tech, cuánto cobrás hoy USD/mes, y cuáles fueron tus 2-3 roles previos más relevantes."

**Bloque 3 — Stack técnico:**
> "Stack principal (las 4-6 tecnologías que más sabés y querés vender), stack secundario (lo que tocás pero no es el foco), 2-3 diferenciadores técnicos (cosas que te hacen distinto al dev promedio), y educación principal."

**Bloque 4 — Logros con números:**
> "3-5 logros tuyos con un número o porcentaje medible. Ejemplos: 'reduje X% costos', 'migré sistema legacy en Y semanas', 'lideré equipo de Z personas'."

**Bloque 5 — Objetivo:**
> "Qué rol estás buscando, banda salarial (piso, realista, stretch — en USD/mes o EUR/mes), mercados target (Argentina, España, US, LATAM, Global), y qué tipo de empresa NO querés (ej. 'no quiero consultoras intermediarias')."

**Bloque 6 — Confidencialidad (CRÍTICO):**
> "Antes de preguntarte: **modo stealth** = 'tu empresa actual no se entera de que estás buscando'. Con stealth ON, las skills evitan todo lo visible (likes/comentarios en ofertas, 'Open to Work' verde público) pero SÍ hacen lo privado que no te delata (señal a recruiters, DMs, solicitudes de conexión, formularios externos). Con stealth OFF hacen todo, incluido lo público. Detalle completo en `${CLAUDE_PLUGIN_ROOT}/shared/stealth-mode.md`.
>
> Dicho eso: ¿estás empleado actualmente? ¿Tu empresa actual debe enterarse que estás buscando? Si no debe enterarse, modo stealth = ON."

**Bloque 7 — Bloqueos y anti-distracciones (si NO hay transcripción de call):**
> "Si ya tuviste call con CoderHub: ¿qué bloqueo principal te identificaron? (ej. 'paso HR pero rebote pre-técnica', 'LinkedIn anonimizado'). ¿Qué te dijeron que NO hagas? (ej. 'no aprender inglés primero')."

---

## Step 3 — Construir el profile

Generar `~/.coderhub/profile.md` siguiendo el schema en `${CLAUDE_PLUGIN_ROOT}/shared/profile-schema.md`. Reglas:

1. **Normalizar formatos:**
   - WhatsApp: `+{código país}{código área}{número}` todo junto, sin espacios ni guiones (ej. `+5491153190688`).
   - URLs: sin trailing slash.
   - Salarios: siempre `USD/mes` o `EUR/mes` con la moneda explícita.

2. **No inventar.** Si un campo no se puede extraer, dejarlo con `(pendiente)` y avisar al cliente al final qué falta.

3. **Stack técnico — orden importa:** el principal arriba, el secundario abajo. El orden dentro del principal es el de prioridad de venta (lo que más quiere ofrecer va primero).

4. **Logros con números — verbo de acción + métrica + impacto:**
   - ✅ "Reduje 70% los costos de generación AI (de $10 a $2-3 USD por guía)"
   - ❌ "Trabajé con AI"

5. **Modo stealth — explícito y razonado:**
   - Si está empleado y la empresa no debe enterarse → ON, agregar nota del por qué.
   - Si está desempleado → OFF, agregar fecha de la última salida si se sabe.

---

## Step 4 — Confirmar con el cliente

Mostrar el `profile.md` lleno al cliente, **bloque por bloque**, y pedir confirmación:

```
Listo, armé tu perfil con los datos que me pasaste. Te lo paso bloque por bloque para que confirmes:

📌 IDENTIDAD
{datos extraídos}
¿Está bien? (sí / corrijo X)

🌍 UBICACIÓN
...

(y así con cada bloque)
```

**No avanzar al siguiente bloque hasta que el cliente confirme el actual.** Si corrige algo, aplicar la corrección y volver a mostrar.

Al final, mostrar la lista de campos que quedaron en `(pendiente)` y avisar:

```
✅ Tu perfil está guardado en `~/.coderhub/profile.md`.

⚠️ Estos campos quedaron sin completar:
- Banda salarial stretch (no apareció en la transcripción)
- Certificaciones (no había en CV)

Si querés completarlos, editá `profile.md` directo o tirame `/coderhub-setup` de nuevo cuando los tengas.

Próximo paso: usá `linkedin-profile-optimizer` para optimizar tu perfil de LinkedIn con estos datos.
```

---

## Step 5 — Guardar

Escribir el resultado en `~/.coderhub/profile.md` (la instancia del alumno, creada en Step 0). **Nunca** escribir en `${CLAUDE_PLUGIN_ROOT}/profile-template/profile.md` — ese es el template en blanco que trae el plugin.

Agregar al final del archivo:

```markdown
*Última actualización: {YYYY-MM-DD}*
```

---

## Reglas

1. **Single source of truth.** El `profile.md` es el ÚNICO lugar donde viven los datos del cliente. Las demás skills lo leen, no lo modifican.
2. **Confirmación bloque por bloque.** Nunca guardar sin que el cliente apruebe lo extraído.
3. **No inventar.** Si falta info, dejarla en `(pendiente)`. Mejor un perfil incompleto y honesto que uno completo y con errores.
4. **No mandar nada.** Esta skill SOLO lee y escribe en disco local. No toca LinkedIn, email, ni redes.
5. **Fuentes oficiales primero.** Si hay LinkedIn URL accesible, usar eso antes que asumir desde CV (LinkedIn refleja el estado actual; CV puede estar desactualizado).
6. **Tono Ariel en las preguntas.** Voseo argentino, directo, sin formalismos. "Tirame en un mensaje..." mejor que "Por favor proporcione...".
7. **Perfil orientado a conseguir trabajo tech.** El `profile.md` es la identidad profesional del alumno para su búsqueda laboral como ingeniero/dev. NO incluir lo que no suma a un rol técnico — emprendimientos propios, podcasts, creación de contenido, coaching, hobbies — aunque aparezca en el LinkedIn o el CV. El foco es 100% "conseguir el próximo trabajo de ingeniería". Ante la duda, dejar afuera lo que no aporta al perfil técnico. (Un blog técnico o proyectos open-source SÍ suman; un podcast de productividad no.)
8. **GitHub estratégico según seniority.** Para **Senior/Lead**, de GitHub se destaca **longevidad** (años programando demostrables desde el año de la cuenta), **actividad constante** y a lo sumo **1-2 proyectos realmente notables** — NUNCA un dump de repos ni sandboxes de aprendizaje (señaliza junior y alarga el CV al pedo). Para junior/semi, un proyecto propio bien hecho sí puede sumar. Default: longevidad + constancia, no catálogo.

---

## Outputs adicionales (opcional)

Si después de generar el `profile.md` el cliente quiere ver qué skills puede correr ahora, decirle:

```
Skills disponibles ahora que tu perfil está configurado:

1. `linkedin-profile-optimizer` — optimizar tu LinkedIn para aparecer en búsquedas de recruiters
2. `linkedin-feed-job-hunter` — aplicar a ofertas que aparecen en tu feed

Tirame el nombre o pedime "optimizá mi LinkedIn" en lenguaje natural.
```

---

## Self-update

Si el cliente flagea un bug del setup (extrajo mal un campo, no detectó un patrón), agregar una entrada al final de este SKILL.md bajo `## Rules (self-updating)` con la fecha y el fix.
