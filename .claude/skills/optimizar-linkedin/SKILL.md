---
name: optimizar-linkedin
description: Optimiza el perfil de LinkedIn del cliente para maximizar visibilidad en búsquedas de recruiters (LinkedIn Recruiter). Lee archivos-generados/perfil.md (creado por configurar-coderhub) y propone cambios concretos en cada sección — Headline, About, Experience, Skills, Featured, Projects, Education, URL, settings de visibilidad. Genera 3 variantes de Headline (keyword-heavy / narrativo / máximo SEO) y deja al cliente elegir. Respeta modo stealth si está activado. NO toca LinkedIn directamente — devuelve los textos para que el cliente los pegue, sección por sección, con confirmación. Triggers on "optimizá mi LinkedIn", "mejorar perfil LinkedIn", "/optimizar-linkedin", "linkedin SEO", "aparecer en búsquedas de recruiters", "headline LinkedIn".
---

# LinkedIn Profile Optimizer

Optimiza el perfil de LinkedIn del cliente para que aparezca en las búsquedas que hacen los recruiters en LinkedIn Recruiter. Tono: seguí la sección Voz de `AGENTS.md`.

## Pre-requisitos

- `archivos-generados/perfil.md` lleno (corrió `configurar-coderhub` antes).
- Si está sin llenar, esta skill **no avanza** — devuelve: *"No encuentro tu perfil cargado. Corré primero `configurar-coderhub`."*

## Outcome

- **Capa visual e identidad** (recomendaciones, no texto para pegar): foto de perfil, banner, nombre visible. Es lo primero que ve el humano y donde más rinde el "makeover" — ver Step 3.0.
- 9 secciones de LinkedIn optimizadas con texto listo para pegar:
  1. Headline (3 variantes — el cliente elige)
  2. About / Acerca de
  3. Experience (cada rol)
  4. Skills (lista de las 50 más relevantes para su stack)
  5. Featured (qué destacar y cómo)
  6. Projects
  7. Education
  8. URL personalizada
  9. Settings de visibilidad y "Open to Work" (configurado según modo stealth)
- Estrategia de keywords explicada (qué keywords priorizar, por qué, cómo distribuirlas).
- **Si modo stealth = ON** → toda la estrategia es "discreto pero visible para LinkedIn Recruiter".
- El documento final se guarda en `archivos-generados/linkedin/` (ver Step 7).

---

## Step 1 — Leer el profile y validar

1. Leer `archivos-generados/perfil.md`.
2. Verificar que tenga estos bloques mínimos:
   - Identidad (nombre, LinkedIn URL)
   - Stack técnico (principal + secundario)
   - Rol actual + roles previos
   - Logros con números
   - Objetivo de búsqueda
   - Modo confidencialidad
3. Si falta algo, listar al cliente qué falta y derivar a `configurar-coderhub`.

## Step 2 — Detectar modo stealth

Leer `.claude/skills/_shared/stealth-mode.md` y aplicar reglas según el campo del profile.

- **Stealth ON** → settings recomiendan "Signal interest to recruiters" pero NO frame verde público; engagement strategy evita posts de hiring.
- **Stealth OFF** → settings activan frame verde público; estrategia incluye comentar/postear sobre búsqueda activa.

## Step 3 — Construir las secciones

**Leer `.claude/skills/optimizar-linkedin/references/quality-bar.md` antes de generar** — es la fuente de verdad del método CoderHub para un buen perfil (el "qué sí / qué no / por qué" de cada sección, con el feedback real de Cami). Es el nivel a igualar — no se copian datos, se copia el nivel y las reglas.

Usar las plantillas en `.claude/skills/optimizar-linkedin/references/section-templates.md`. Cada sección sale parametrizada con los datos del profile, no inventada.

### 3.0 Capa visual e identidad (foto · banner · nombre visible)

Esto es lo **primero que ve un humano** y donde más rinde el makeover — pero NO es texto para pegar, son recomendaciones que el cliente ejecuta con una herramienta de imagen. Ver `quality-bar.md` §2-§4. Entregar:

- **Foto:** si la actual es formal-RRHH (traje/corbata, foto carnet), recomendar el remake — fondo claro, chomba/remera blanca o negra, más luz, idealmente un fondo "de ingeniero" que insinúe el stack. Modernizar ("ayornar"), no formalizar. Se puede usar IA (ojo que cambia la cara — verificar que siga siendo reconocible).
- **Banner:** stack completo (incluida AI), tipografía clara, "con onda" (sugerir Canva). El default azul de LinkedIn es real estate desperdiciado.
- **Nombre visible:** un solo nombre de pila (el más corto/reconocible) + apellido. No los dos nombres.

Presentar como checklist accionable ("esta semana: cambiá foto, banner y nombre visible así"). No bloquea el resto de las secciones de texto.

### 3.1 Headline (3 variantes)

Generar 3 opciones siguiendo `.claude/skills/optimizar-linkedin/references/section-templates.md`:

- **A — Keyword-heavy:** roles + tecnologías separadas por `·` + diferenciador + 🌍 si es remoto. Máximo SEO.
- **B — Narrativo:** rol + stack agrupado + "Building/Specialized in..." + Open to Remote.
- **C — Máximo SEO:** todo el stack apilado, separadores `·`, sin texto narrativo.

Mostrar las 3, recomendar la que mejor balancea SEO + lectura humana según el perfil:

```
HEADLINE — 3 opciones:

Opción A (keyword-heavy):
  {texto A}

Opción B (narrativo):
  {texto B}

Opción C (máximo SEO):
  {texto C}

Recomiendo la **{X}** porque {razón basada en perfil}.

¿Cuál elegís? (A / B / C / mixar)
```

### 3.2 About

Estructura:

1. **Línea 1 (lo único visible sin expandir):** rol + años de experiencia + stack core + 1 diferenciador.
2. **Línea 2-3:** rol actual + 1 logro con número del profile.
3. **"What I bring to the table:"** lista de 4-6 bullets agrupando capabilities.
4. **🌍 disponibilidad + 🗣️ idiomas** del profile.
5. **Tech Stack:** dump de todas las skills separadas por `·` (LinkedIn indexa este bloque).
6. **CTA + links** del profile.

Si stealth = ON, el CTA es **"Open to new opportunities — let's connect!"** (genérico, no grita "busco trabajo").
Si stealth = OFF, el CTA puede ser más explícito: **"Actively seeking new opportunities — DM me!"**.

### 3.3 Experience (por cada rol)

Para cada rol en el profile:
1. Título sugerido con keywords (no solo el cargo "Software Engineer", sino "Senior Backend Engineer (PHP/Laravel, AWS, Microservices)").
2. Descripción con:
   - 1 línea de contexto
   - "Key achievements:" con 4-6 bullets
   - Cada bullet: verbo de acción + qué hizo + tecnologías + métrica si la hay
   - Última línea: "Tech stack: X · Y · Z" (dump de keywords del rol)

### 3.4 Skills (50 máximo)

Leer stack del profile y armar 3 grupos:

- **Obligatorias (~15):** las skills más buscadas del stack principal.
- **Importantes (~25):** stack secundario + soft skills (Project Management, Team Leadership, etc.).
- **Tendencia/IA (~10):** keywords calientes — AI Agents, Claude AI, MCP, Prompt Engineering, LLM Integration.

Recomendar:
- Top 3 visibles del perfil deben ser las 3 más buscadas para el rol target.
- Eliminar skills irrelevantes que diluyan el perfil.
- Pedir endorsements activamente.

### 3.5 Featured

Recomendar qué destacar (según los links del profile): Portfolio, Certificaciones, posts técnicos del cliente, demo/screenshot de un proyecto destacado.

### 3.6 Projects

Para cada logro con número del profile, armar un Project entry: nombre (con métrica si aplica), descripción 2-3 líneas, lista de tecnologías.

### 3.7 Education

Volcar lo que está en el profile. Sugerir agregar 1 línea de descripción con materias relevantes al stack target.

### 3.8 URL personalizada

Recomendar `linkedin.com/in/{nombre-apellido}` si está disponible, o mantener la actual.

### 3.9 Settings de visibilidad y Open to Work

Configurar según `.claude/skills/_shared/stealth-mode.md`:

| Setting | Stealth ON | Stealth OFF |
|---|---|---|
| Open to Work — visible para todos (frame verde) | ❌ NO | ✅ SÍ |
| Open to Work — visible solo para recruiters | ✅ SÍ | ✅ SÍ |
| Signal interest to recruiters | ✅ SÍ | ✅ SÍ |
| Profile viewing options | "Your name and headline" | "Your name and headline" |
| Share profile updates with network | Discrecional | ✅ SÍ |

Configurar Open to Work con: títulos (rol target + variantes), tipos (Full-time/Contract/Freelance según objetivo), ubicaciones (Remote/país/Worldwide del profile), fecha de inicio ("Immediately"/"Flexible" según urgencia).

## Step 4 — Estrategia de keywords (la teoría)

Después de mostrar los textos, explicar cómo funciona LinkedIn Recruiter (peso por campo). Ver `.claude/skills/optimizar-linkedin/references/linkedin-seo-strategy.md` para la tabla completa.

Mostrar al final cuáles son las 10-15 keywords prioritarias para su rol target y en qué campos deberían aparecer.

## Step 5 — Engagement strategy (consciente del modo stealth)

Recomendar acciones diarias/semanales para amplificar visibilidad orgánica. Las acciones cambian según stealth. Ver `.claude/skills/optimizar-linkedin/references/engagement-strategy.md`.

## Step 6 — Output final

Entregar un documento estructurado con:

1. 🎨 Capa visual (foto · banner · nombre visible) — checklist accionable de la semana
2. ✅ Cambios sección por sección (textos listos para pegar)
3. 🎯 Keywords prioritarias y dónde van
4. 📅 Plan de engagement (qué hacer esta semana)
5. ⚙️ Settings a verificar
6. 📊 Una métrica esperada (ej. "deberías ver 30-50% más profile views en 14 días si aplicás todo")

## Step 7 — Guardar

Guardar el documento final en `archivos-generados/linkedin/{YYYY-MM-DD}_linkedin-optimizado.md` (crear `archivos-generados/linkedin/` si no existe). Mostrar la ruta al cliente para que lo tenga a mano mientras pega sección por sección.

## Reglas

1. **Modo stealth es no-negociable.** Si está ON, NUNCA recomendar acciones públicas que delaten búsqueda.
2. **Confirmar antes de cada sección.** El cliente aprueba o ajusta cada bloque antes de pasar al siguiente.
3. **Nunca tocar LinkedIn directo.** La skill devuelve textos. El cliente los pega. Es deliberado: que revise una vez más y se sienta dueño del cambio.
4. **No inventar logros.** Solo usar los que están en `archivos-generados/perfil.md`. Si necesitamos más, derivar a `configurar-coderhub` para sumarlos al profile.
5. **Idioma:** la copy va en español o inglés según el target. US/Global → **inglés**; LATAM hispano puro → **español**; ambos → **bilingüe** (inglés primero, español como segunda parte del About).
