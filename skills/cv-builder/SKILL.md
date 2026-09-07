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
   • Windows:  winget install Typst.Typst    (o: scoop install typst)
   • Linux:    ver https://github.com/typst/typst#installation
   Instalalo y volvé a tirarme "armame el CV".
   ```
   y parar.

## Step 2 — Leer el perfil + detectar modo

1. Leer `~/.coderhub/profile.md` entero.
2. Verificar que tenga los bloques mínimos para un CV: Identidad, Rol y experiencia, Stack técnico, Logros, Educación, Idiomas. Si falta algo importante, listar qué falta y ofrecer completar el perfil (derivar a `coderhub-setup`) — pero si hay lo suficiente para un CV decente, seguir y avisar qué quedó flojo.
3. **¿Hay una oferta (JD) para tailorear?** Si el alumno ya pegó un job posting (texto/URL), usarlo → **modo tailoreado**. Si NO pasó ninguno, **preguntar antes de generar**: *"¿Tenés el texto de alguna oferta (JD) a la que quieras apuntar este CV? Si me la pasás, lo adapto a ese puesto — reordeno stack, logros y proyectos para el match. Si no, te armo uno general para postular en general."* Con oferta → modo tailoreado; sin oferta → modo general.
4. **Idioma del CV** — decidir según el target del perfil (campo Objetivo → mercados) y, si hay oferta, el idioma de la oferta:
   - Target **solo hispano** (Argentina, España, LATAM) → **ES**.
   - Target **solo inglés** (US, Global, Europa no-hispana) → **EN**.
   - Target **bilingüe / mixto** (ej. LATAM + US) → **generar las DOS versiones** (una en ES y una en EN). Es el caso más común y tener las dos listas le ahorra al alumno pedirlo.
   - Si hay una oferta puntual → priorizar el idioma de esa oferta.
   - Si el target no está claro en el perfil → preguntar una vez: *"¿El CV lo querés en español, en inglés, o las dos versiones?"*
   No mezclar idiomas dentro de un mismo CV.

## Step 3 — Armar el contenido

Leer `${CLAUDE_SKILL_DIR}/references/typst-template.md` — tiene el API del package, el template de ejemplo, y el mapeo `profile.md → secciones del CV`.

**Leer `${CLAUDE_SKILL_DIR}/references/quality-bar.md` antes de generar** — destila CVs reales de alumnos que quedaron muy bien: estructura canónica, la fórmula del PROFILE, la regla de oro (casi todos los bullets cuantificados), el diferenciador AI-native, cómo agrupar skills, el truco del `date:` en proyectos, y un checklist final. Es el nivel a igualar — no se copian datos, se copia el nivel y la estructura.

Mapear el perfil a las secciones: Perfil, Experiencia Laboral, Educación, Habilidades Técnicas, Proyectos Relevantes, Idiomas.

**Reglas de contenido:**
- **No inventar.** Solo lo que está en el perfil. Si el perfil no tiene un dato (ej. GitHub), omitir esa línea — no rellenar.
- **Logros con números primero.** Cada bullet de experiencia y cada proyecto se apoya en un logro medible del perfil (verbo de acción + qué + tech + métrica).
- **Modo tailoreado:** subir arriba el stack, los logros y los proyectos que matchean la oferta. Bajar (o cortar) lo irrelevante. El objetivo es que un recruiter que lee 6 segundos vea el match al toque. Seguir respetando "no inventar".
- **Longitud:** apuntar a 1 página (2 máximo si la experiencia lo justifica). Cortar ruido antes que estirar.

## Step 4 — Generar el .typ y compilar

1. Crear el directorio: `mkdir -p ~/.coderhub/cv`.
2. Por cada idioma decidido en Step 2 (uno o dos), escribir un `.typ` en `~/.coderhub/cv/` siguiendo el formato exacto de las funciones del package (ver reference). Usar `@preview/silver-dev-cv:1.0.2`. Naming:
   - Una sola versión → `{slug}-cv.typ`
   - Dos versiones → `{slug}-cv-es.typ` y `{slug}-cv-en.typ`

   donde `{slug}` es el nombre del alumno en kebab-case (ej. `matias-sanchez`).
3. Compilar cada `.typ` a su PDF con el mismo nombre:
   ```bash
   typst compile ~/.coderhub/cv/{slug}-cv.typ ~/.coderhub/cv/{slug}-cv.pdf
   ```
   El package se baja solo en el primer compile (necesita internet una vez).
4. **Si el compile falla:** mostrar el error de typst + el bloque del `.typ` cerca del error, arreglar la sintaxis, y reintentar. Errores típicos: comas faltantes en `contacts`, bullets mal formateados en `description`, comillas sin cerrar. No devolver un error crudo sin contexto.
5. Copiar el/los PDF a `~/Downloads/` como conveniencia:
   ```bash
   cp ~/.coderhub/cv/{slug}-cv*.pdf ~/Downloads/
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
- **2026-09-04** — **Bullets como RESULTADO, no como objetivo** (corrección #1 de Cami en 3 CV reviews): no "hice X *para* lograr Y"; sí "hice X *que* logró Y". Y sacar señales que auto-filtran/restan: `Open to Remote` y `Available to start immediately` en el header = señal junior/desesperación (debilitan la negociación) → fuera. Título al nivel **target**, no al "seguro". Método completo + feedback de Cami en `${CLAUDE_SKILL_DIR}/references/quality-bar.md` (§5, §12, §14).
- **2026-09-02** — **El CV es SIEMPRE para conseguir trabajo como ingeniero/dev.** Dejar afuera todo lo que no suma a un rol técnico (emprendimientos, podcasts, creación de contenido, coaching, hobbies), aunque esté en el perfil. El CV vende al ingeniero, no a la persona completa. Un blog técnico u open-source sí suma.
- **2026-09-02** — **Siempre preguntar por una JD antes de generar** (si el alumno no la pasó). Un CV tailoreado a la oferta rinde mucho más que uno genérico. Ver Step 2.
- **2026-09-02** — **Anti-slop: nada de filler promocional ni tells de IA.** El impacto lo dan los NÚMEROS, no los adjetivos. Prohibido el relleno de resume/IA: `at scale`, `proven track record`, `deep expertise`, `measurably`, `single-handedly`, `end-to-end`, `passionate`, `results-driven`, `spearheaded`, `leverage`/`utilize`, `cutting-edge`, `world-class`, `robust/seamless/scalable` como adjetivos sueltos. Regla simple: **si un adjetivo o adverbio no agrega un hecho o un número, va afuera.** Además: **máximo 1 em-dash por bullet** (preferir punto, coma o paréntesis — el abuso de `—` es tell de IA); no forzar rule-of-three; verbo de acción concreto + qué + tech + resultado medible, sin envoltorio. Antes de compilar, releer cada bullet y borrar toda palabra que no aporte dato.
- **2026-09-02** — **Escapar los caracteres especiales de Typst en el CONTENIDO.** En el body de Typst: `@` inicia una referencia (**rompe el compile** — caso real: `@arielmirra`), `~` es espacio duro (mete espacios raros — caso real: `~8` renderizó como ` 8`), `$` abre modo matemático, `#` inicia código, y `_`/`*` son énfasis. En todo texto que venga del perfil (handles tipo `medium.com/@user`, rangos tipo `~8`, sueldos con `$`, hashtags con `#`), escapar con `\` (`\@`, `\~`, `\$`, `\#`, `\_`, `\*`) o reformular (ej. `8+ years` en vez de `~8 years`). Chequear especialmente emails/handles/URLs y cualquier símbolo antes de compilar.

## Self-Update

Si el alumno flagea un problema (sintaxis Typst que rompe el compile, campo del perfil mal mapeado, sección en el orden equivocado, idioma incorrecto), agregá una entrada con fecha de hoy a `## Rules` describiendo el fix. El objetivo es que el mismo error no se repita en el próximo CV.

## Troubleshooting

- **`typst: command not found`** — no está instalado. Ver Step 1. Mac: `brew install typst`.
- **El primer compile tarda o falla por red** — el package `silver-dev-cv` se baja de Typst Universe la primera vez. Verificar conexión y reintentar; después queda cacheado en `~/.cache/typst/`.
- **Error de sintaxis en el compile** — casi siempre es una coma faltante en `contacts`, un bullet mal armado en `description`, o comillas/corchetes sin cerrar. Mostrar el fragmento del `.typ` cerca del error, arreglar, reintentar.
- **El perfil está muy incompleto** — si faltan bloques clave (experiencia, stack, logros), el CV sale pobre. Derivar a `/coderhub:coderhub-setup` para completar el perfil antes de insistir con el CV.
