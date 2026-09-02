---
name: cv-builder
description: Genera el CV en PDF del alumno de CoderHub a partir de su perfil (~/.coderhub/profile.md), usando el template Typst silver-dev-cv. Opcionalmente lo tailorea a una oferta específica reordenando stack, logros y proyectos para maximizar el match — sin inventar nada. Reemplaza el flujo viejo de clonar un template Typst y editarlo a mano. Triggers on "armame el CV", "generá mi CV", "hacé mi currículum", "CV para esta oferta", "adaptá mi CV a este puesto", "/cv-builder", "necesito un CV en PDF". Lee el perfil que arma coderhub-setup; si no existe, deriva a /coderhub:coderhub-setup. Requiere typst instalado (brew install typst). NO inventa experiencia — el perfil es la única fuente de verdad.
---

# CV Builder

Arma el CV en PDF del alumno desde su `~/.coderhub/profile.md`, con el template Typst `silver-dev-cv`. Si el alumno pega una oferta, adapta el orden y el énfasis para esa oferta — sin inventar experiencia.

## Pre-requisitos

- **`~/.coderhub/profile.md` lleno** (corrió `coderhub-setup` antes). Si no existe → *"No encuentro tu perfil. Corré primero `/coderhub:coderhub-setup` y volvé."* y parar.
- **`typst` instalado**. Si `which typst` no lo encuentra → dar el hint y parar (ver Step 1). El resto de las skills del plugin no lo necesitan; esta sí.

## Outcome

- Un `main.typ` generado con los datos del alumno en `~/.coderhub/cv/`.
- El CV compilado en PDF: `~/.coderhub/cv/{slug}-cv.pdf` (+ copia en `~/Downloads/`).
- Si hubo oferta: el CV reordenado para maximizar el match con ese puesto.
- El alumno confirma y puede pedir ajustes (idioma, orden de secciones, otra oferta).

## Skill Relationships

- **Upstream:** `coderhub-setup` — genera el `~/.coderhub/profile.md` que esta skill consume. Sin perfil, esta skill no corre.
- **Sibling:** `interview-prep` — mismo patrón de "tailorear a una oferta". Si el alumno está preparando una entrevista para un puesto, tiene sentido ofrecerle también adaptar el CV a esa oferta.
- **Sibling:** `linkedin-profile-optimizer` — el CV y el LinkedIn deben contar la misma historia (mismos logros con números, mismo stack priorizado).

## Step 1 — Validar perfil + typst

1. Chequear `~/.coderhub/profile.md`. Si no existe, derivar a `/coderhub:coderhub-setup` y parar.
2. Chequear `typst`:
   ```bash
   which typst
   ```
   Si no está instalado, decir (sin error feo):
   ```
   Para armar el CV necesitás typst (el compilador que genera el PDF). Instalalo:
   • Mac:      brew install typst
   • Win/Linux: https://github.com/typst/typst#installation
   Instalalo y volvé a tirarme "armame el CV".
   ```
   y parar.

## Step 2 — Leer el perfil + detectar modo

1. Leer `~/.coderhub/profile.md` entero.
2. Verificar que tenga los bloques mínimos para un CV: Identidad, Rol y experiencia, Stack técnico, Logros, Educación, Idiomas. Si falta algo importante, listar qué falta y ofrecer completar el perfil (derivar a `coderhub-setup`) — pero si hay lo suficiente para un CV decente, seguir y avisar qué quedó flojo.
3. **¿Hay oferta?** Si el alumno pegó un job posting (texto/URL), es **modo tailoreado**. Si no, es **modo general** (CV parejo que sirve para postular en general).
4. **Idioma del CV:** ES o EN según el target del alumno (campo Objetivo → mercados) y, si hay oferta, el idioma de la oferta. Si el target es US/Global → EN. Si es LATAM hispano → ES. Ante la duda, preguntar una vez.

## Step 3 — Armar el contenido

Leer `${CLAUDE_SKILL_DIR}/references/typst-template.md` — tiene el API del package, el template de ejemplo, y el mapeo `profile.md → secciones del CV`.

Mapear el perfil a las secciones: Perfil, Experiencia Laboral, Educación, Habilidades Técnicas, Proyectos Relevantes, Idiomas.

**Reglas de contenido:**
- **No inventar.** Solo lo que está en el perfil. Si el perfil no tiene un dato (ej. GitHub), omitir esa línea — no rellenar.
- **Logros con números primero.** Cada bullet de experiencia y cada proyecto se apoya en un logro medible del perfil (verbo de acción + qué + tech + métrica).
- **Modo tailoreado:** subir arriba el stack, los logros y los proyectos que matchean la oferta. Bajar (o cortar) lo irrelevante. El objetivo es que un recruiter que lee 6 segundos vea el match al toque. Seguir respetando "no inventar".
- **Longitud:** apuntar a 1 página (2 máximo si la experiencia lo justifica). Cortar ruido antes que estirar.

## Step 4 — Generar el .typ y compilar

1. Crear el directorio: `mkdir -p ~/.coderhub/cv`.
2. Escribir el `main.typ` en `~/.coderhub/cv/main.typ` siguiendo el formato exacto de las funciones del package (ver reference). Usar `@preview/silver-dev-cv:1.0.2`.
3. Compilar:
   ```bash
   typst compile ~/.coderhub/cv/main.typ ~/.coderhub/cv/{slug}-cv.pdf
   ```
   donde `{slug}` es el nombre del alumno en kebab-case (ej. `matias-sanchez-cv.pdf`). El package se baja solo en el primer compile (necesita internet una vez).
4. **Si el compile falla:** mostrar el error de typst + el bloque del `main.typ` cerca del error, arreglar la sintaxis, y reintentar. Errores típicos: comas faltantes en `contacts`, bullets mal formateados en `description`, comillas sin cerrar. No devolver un error crudo sin contexto.
5. Copiar el PDF a `~/Downloads/` como conveniencia:
   ```bash
   cp ~/.coderhub/cv/{slug}-cv.pdf ~/Downloads/
   ```

## Step 5 — Confirmar + ofrecer ajustes

Mostrar:
1. **Path del PDF** (absoluto) + que quedó copiado en Downloads.
2. Qué modo se usó (general / tailoreado a "{empresa/puesto}").
3. Idioma.
4. Si algo del perfil quedó flojo o faltó, decirlo en una línea.

Cerrar ofreciendo ajustes:
```
¿Lo ajustamos?
- "poné la experiencia arriba" / "sacá tal proyecto" → reordeno
- "pasalo a inglés" → regenero en EN
- "adaptalo a esta otra oferta: {...}" → tailoreo a ese puesto
- "cambiá la fuente" → pruebo otra
```

Si el alumno marca un problema con el output (formato, orden, algo mal mapeado del perfil), corregir **y** actualizar `## Rules` (ver Self-Update).

## Rules

*Se actualizan cuando el alumno marca un problema. Leer antes de cada corrida.*

- **2026-09-02** — No inventar experiencia, logros ni tecnologías. El `~/.coderhub/profile.md` es la única fuente de verdad. Si falta un dato, se omite la línea; no se rellena con genéricos.
- **2026-09-02** — El output SIEMPRE va a `~/.coderhub/cv/` (+ copia en `~/Downloads/`). Nunca escribir el CV en el directorio actual del alumno ni dentro del plugin.
- **2026-09-02** — typst es dependencia externa del alumno. El plugin no la instala — si falta, se da el hint y se para (sin error feo).

## Self-Update

Si el alumno flagea un problema (sintaxis Typst que rompe el compile, campo del perfil mal mapeado, sección en el orden equivocado, idioma incorrecto), agregá una entrada con fecha de hoy a `## Rules` describiendo el fix. El objetivo es que el mismo error no se repita en el próximo CV.

## Troubleshooting

- **`typst: command not found`** — no está instalado. Ver Step 1. Mac: `brew install typst`.
- **El primer compile tarda o falla por red** — el package `silver-dev-cv` se baja de Typst Universe la primera vez. Verificar conexión y reintentar; después queda cacheado en `~/.cache/typst/`.
- **Error de sintaxis en el compile** — casi siempre es una coma faltante en `contacts`, un bullet mal armado en `description`, o comillas/corchetes sin cerrar. Mostrar el fragmento del `.typ` cerca del error, arreglar, reintentar.
- **El perfil está muy incompleto** — si faltan bloques clave (experiencia, stack, logros), el CV sale pobre. Derivar a `/coderhub:coderhub-setup` para completar el perfil antes de insistir con el CV.
