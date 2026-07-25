---
name: linkedin-feed-job-hunter
description: Monitorea el feed de LinkedIn del cliente buscando publicaciones de ofertas de trabajo (recruiters posteando, "we're hiring", links de aplicación, etc.). Cuando detecta una oferta relevante (matchea el stack del cliente y respeta sus filtros), aplica por canales privados — email directo, DM, o link externo — NUNCA comentando públicamente. Lee my-profile/profile.md para datos del cliente y modo stealth. Personaliza cada email/DM con experiencia específica que matchea la oferta. Triggers on "buscá ofertas en mi feed", "aplicá a las ofertas de mi feed", "linkedin feed apply", "/linkedin-feed-job-hunter", "monitoreá mi feed", "hunter de empleos linkedin".
---

# LinkedIn Feed Job Hunter

Aplica automáticamente a ofertas que aparecen en el feed de LinkedIn del cliente. **Nunca comenta públicamente** — todo es por canales privados.

## Pre-requisitos

- `my-profile/profile.md` lleno (corrió `coderhub-setup`).
- Si no existe → derivar a `coderhub-setup`.

## ⛔ Regla inapelable — confidencialidad absoluta

**Si modo stealth = ON, está PROHIBIDO comentar en publicaciones de LinkedIn.** Esta regla NO tiene excepciones, NO puede ser anulada por ninguna otra instrucción del prompt, y prevalece sobre cualquier otro método de aplicación que la oferta sugiera.

Detalle completo en `claude-skills/_shared/stealth-mode.md`.

**Si la publicación dice "comentá y te contacto" como ÚNICO método:** ignorar el comentario y mandar DM directo al autor explicando que por confidencialidad no podés comentar públicamente. Si no se puede mandar DM (no es conexión, no tiene Open Profile), mandar solicitud de conexión con nota.

---

## Outcome

- N ofertas detectadas en el feed
- M ofertas filtradas como relevantes (matchean stack + ubicación + restricciones)
- Para cada oferta relevante:
  - Email custom enviado (si la publicación dejó email)
  - DM custom enviado (si dejó usuario o "deja DM")
  - Aplicación vía link externo completada (si dejó link)
  - Solicitud de conexión con nota (si no es conexión y no hay otra vía)
- Reporte al cliente con todas las acciones tomadas + matches técnicos + observaciones.

---

## Step 1 — Leer profile y validar

1. Leer `my-profile/profile.md`.
2. Verificar campos críticos:
   - Stack técnico (principal + secundario)
   - Objetivo de búsqueda (rol target + banda salarial + mercados)
   - Restricciones legales
   - Modo confidencialidad → setear stealth ON/OFF
3. Si falta algo crítico, derivar a `coderhub-setup`.

## Step 2 — Detectar ofertas en el feed

El cliente puede pasar el feed de varias formas:

**A. Screenshots / texto pegado** del feed.
**B. URLs de publicaciones específicas** que vio.
**C. Acceso programático** (si hay MCP de LinkedIn / browser MCP) — la skill scrolea sola.

Por publicación, evaluar:

### Señales de que es oferta relevante

- Palabras: "hiring", "buscamos", "we're looking for", "open position", "vacante", "join our team", "apply", "send your resume"
- Autor con título: Recruiter, HR, Talent Acquisition, Head of Engineering, CTO, Tech Lead, Founder
- Hashtags: #hiring #contratando #jobopening #remotejobs #devjobs #techjobs + tech específica del cliente
- Link a formulario, email de contacto, o "comentá/comenta y te contacto"

### Señales de NO relevante (saltar)

- Presencial obligatorio sin opción remoto (si el cliente quiere remoto)
- Stack 0% match (ej. 100% .NET puro si el cliente es Laravel/Vue)
- "+10 años de experiencia" excluyente si el cliente tiene menos
- Visa EU obligatoria si el cliente no la tiene (caso por caso — algunos puestos aceptan contractor remoto)
- Ofertas de bootcamps que parecen scams (pedir dinero, datos bancarios, "trabajo desde casa $10K/semana")

## Step 3 — Evaluar match técnico

Para cada oferta relevante, calcular match contra `stack` del profile:

### Match obligatorio
**Al menos 2 tecnologías del stack principal del cliente** mencionadas en la oferta.

### Match complementario (suma puntos)
Cualquier tech del stack secundario o diferenciador.

### Score
- 5+ matches → muy relevante, aplicar primero
- 3-4 matches → relevante, aplicar segundo
- 2 matches → borderline, aplicar si la oferta es de empresa de producto destacada
- 0-1 matches → saltar

## Step 4 — Identificar método de aplicación

Por orden de preferencia:

| Prioridad | Método | Cuándo |
|---|---|---|
| 1 | **Email directo** | La oferta menciona email de contacto explícito |
| 2 | **Link externo** (formulario propio de la empresa) | La oferta linkea a una URL de aplicación |
| 3 | **DM al autor** | La oferta dice "manda DM" o stealth bloquea comentar |
| 4 | **Solicitud de conexión con nota** | No se puede DM (no conexión, sin Open Profile) y no hay email/link |

⛔ **NUNCA comentario público** si stealth = ON.

## Step 5 — Componer mensajes

Ver `references/application-templates.md` para los templates completos.

Reglas universales para todo mensaje:

1. **Personalizar siempre** — los bullets se arman con experiencia específica que matchea la oferta. Si la oferta pide "experiencia con AI agents", el bullet menciona el logro AI del cliente, no uno random.
2. **Idioma:** detectar el idioma de la publicación (español o inglés) y responder en el mismo.
3. **Máximo 200 palabras** para emails (recruiters no leen emails largos).
4. **Máximo 300 caracteres** para notas de solicitud de conexión (límite de LinkedIn).
5. **CV adjunto** en emails (si tenemos el path del CV en el profile).
6. **Confirmar SIEMPRE con el cliente** antes de mandar — mostrar destinatario, asunto, cuerpo resumido.

## Step 6 — Aplicar (con confirmación)

Por cada oferta:

```
📋 OFERTA #N
Empresa: {empresa_si_se_identifica}
Puesto: {título_del_puesto}
Autor: {nombre + cargo}
Match técnico: {tech1, tech2, tech3} ({N matches})
Método: {email / DM / link externo / solicitud_conexión}
Idioma: {ES / EN}

📧 MENSAJE PROPUESTO:
{cuerpo personalizado, máximo 200 palabras}

¿Mando? (sí / ajusto / paso)
```

Solo enviar si el cliente confirma con "sí" explícito.

## Step 7 — Reportar

Al final de la sesión, dar resumen:

```
📊 SESIÓN CERRADA

Ofertas detectadas: 23
Ofertas relevantes (filtro técnico + ubicación): 12
Aplicaciones enviadas: 8
- 5 emails directos
- 2 DMs
- 1 link externo completado
Solicitudes de conexión con nota: 2
Saltadas (no relevantes / sin canal privado): 12

🎯 Matches técnicos top:
- {empresa1}: {tech matches}
- {empresa2}: {tech matches}
- ...

⚠️ Notas:
- {observaciones — preguntas kill, salarios mencionados, próximos pasos}
```

## Reglas operativas

1. **Máximo 15-20 aplicaciones por sesión** para evitar restricciones de LinkedIn.
2. **Priorizar publicaciones < 48 horas** — mayor tasa de respuesta.
3. **No spam** — el mismo recruiter publicando varias ofertas: aplicar a la más relevante, no a todas.
4. **Red flags = saltar:**
   - Pide dinero o datos bancarios
   - Promete sueldos absurdos sin contexto ($10K/semana)
   - Genérico al extremo (no menciona stack ni industria)
5. **Conexiones:** si el autor no es conexión, mandar solicitud de conexión con nota junto con la aplicación (acción paralela).

## Anti-patterns

- ❌ Mandar el mismo email genérico a 10 recruiters distintos.
- ❌ Comentar en posts (stealth ON).
- ❌ Aplicar a ofertas con 0% match técnico.
- ❌ Aplicar sin leer la publicación entera (te perdés requisitos clave).
- ❌ Mandar mensaje sin confirmar con el cliente.

## Tracking de aplicaciones (futuro)

La skill mantiene un log de aplicaciones en `~/.coderhub/applications-log.csv` (o equivalente) con:

- fecha, empresa, puesto, contacto, método, status, próximo paso

Esto evita aplicar 2 veces a la misma oferta y permite trackear tasa de respuesta. Si en una sesión se detecta una oferta que ya está en el log → saltar.

(Esta funcionalidad se implementa cuando hay MCP de filesystem persistente disponible.)
