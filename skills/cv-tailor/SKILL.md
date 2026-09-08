---
name: cv-tailor
description: Adapta un CV YA GENERADO (por cv-builder, en ~/.coderhub/cv/*.typ) a una Job Description específica, exagerando el fit dentro de lo defendible para maximizar el match con ese puesto. Reordena stack y bullets, reescribe el summary al rol de la oferta, refuerza las keywords de la JD y flaguea los gaps reales. Usá esta skill siempre que el alumno pegue una oferta/JD y quiera adaptar su CV a ese puesto, o diga "ajustá mi CV a esta oferta", "adaptá el CV a esta JD", "CV para esta búsqueda", "CV para este puesto", "tailoreá el CV", "hacé un CV para esta oferta", "/cv-tailor". Requiere un CV base ya validado — si no existe ninguno en ~/.coderhub/cv/, deriva a cv-builder primero. NO es para generar el CV desde cero (eso es cv-builder) ni para preparar la entrevista (eso es interview-prep). Requiere typst instalado. NO inventa empresas, roles ni años.
---

# CV Tailor

Toma el CV base ya validado del alumno y lo adapta a una oferta puntual: reordena el énfasis, reescribe el resumen al rol de la JD, sube las keywords que el puesto pide y empuja el fit hasta el límite de lo que se puede defender en la entrevista. Genera una **versión nueva** por oferta — nunca pisa el CV base.

La lógica detrás: un CV genérico compite mal. El mismo perfil, reordenado y redactado hacia una JD específica, pasa el filtro del ATS (keywords) y gana los 6-10 segundos del recruiter (match rápido). Este es el paso que casi nadie hace y el que más mueve la aguja por aplicación.

## Pre-requisitos

- **Un CV base en `~/.coderhub/cv/*.typ`** (lo generó `cv-builder`). Si no hay ninguno → *"No encuentro un CV base tuyo. Generalo primero con `/coderhub:cv-builder` y después volvé con la oferta."* y parar. El CV base es el material validado; esta skill solo lo re-enfoca, no lo crea.
- **El texto de la JD.** Sin oferta, esta skill no tiene qué hacer — es `cv-builder` en modo general. Si el alumno no la pegó, pedirla (Step 2).
- **`typst` instalado** (`which typst`). Si falta, dar el hint y parar (ver Step 1).

## Outcome

- Una **copia tailoreada** del `.typ` base en `~/.coderhub/cv/{slug}-cv-{jd-slug}.typ` (+ PDF con el mismo nombre), sin tocar el base.
- Copia del PDF en `~/Downloads/` con nombre legible: `{Nombre} - CV - {Rol o Empresa}.pdf`.
- Un **reporte de match**: qué keywords de la JD quedaron cubiertas y en qué bullet, y qué requisitos el alumno genuinamente no tiene (para que decida defenderlos o no).
- El alumno confirma y puede pedir otra oferta o más ajuste.

## Skill Relationships

- **Upstream (requerido):** `cv-builder` — genera el CV base validado que esta skill re-enfoca. Sin CV base, `cv-tailor` no corre; deriva a `cv-builder`.
- **Límite con `cv-builder`:** `cv-builder` arma el CV **desde el perfil** (y opcionalmente lo tailorea *ligero* si le pasás una JD al momento de crearlo). `cv-tailor` asume que el base **ya existe y está validado**, y va **más fuerte** con el match: reescribe summary, reordena todo hacia la JD, refuerza keywords y empuja el fit. Si el alumno todavía no tiene un CV base, es tarea de `cv-builder`; si ya lo tiene y quiere una versión para una oferta puntual, es esta skill.
- **Sibling:** `interview-prep` — una vez tailoreado el CV a un puesto, tiene sentido preparar la entrevista de ESE puesto (y defender lo que se "puso de más").
- **Sibling:** `linkedin-profile-optimizer` — el CV tailoreado y el LinkedIn deben contar la misma historia; si un logro se re-enfocó acá, conviene reflejarlo allá.

## Step 1 — Validar CV base + typst

1. Listar los CV base disponibles:
   ```bash
   ls ~/.coderhub/cv/*.typ 2>/dev/null
   ```
   - **Ninguno** → derivar a `/coderhub:cv-builder` y parar (ver Pre-requisitos).
   - **Uno** → ese es el base.
   - **Varios** (ej. una versión ES y una EN, o versiones por rol) → preguntar cuál usar de base: *"Tenés varios CV. ¿Sobre cuál adapto? {lista}"*. Ignorar como candidatos los que ya son salidas tailoreadas previas (`*-cv-*.typ`) salvo que el alumno lo pida.
2. Chequear `typst`:
   ```bash
   which typst
   ```
   Si no está, dar el hint (Mac `brew install typst` / Windows `winget install Typst.Typst`) y parar — igual que `cv-builder`.

## Step 2 — Conseguir la JD + extraer keywords

1. **Conseguir el texto de la JD.** Si el alumno ya lo pegó, usarlo. Si pasó una URL, intentar leerla; si no se puede, pedir que pegue el texto. Si no pasó nada: *"Pegame el texto de la oferta (la JD completa: responsabilidades + requisitos). Con eso adapto el CV a ese puesto."* y esperar.
2. **Extraer las 5-7 keywords/skills que más pesan:** las que se repiten, las marcadas como *must-have / required*, el **nombre del rol** tal como lo escribe la JD, el **stack** principal, el **dominio** (fintech, health, infra, data, etc.) y las señales de seniority. Anotarlas — son el objetivo de todo el tailoreo.
3. Distinguir **must-have** (requisitos duros, "X años de", "required") de **nice-to-have** ("plus", "bonus", "nice to have"). Los must-have mandan el reordenamiento y el summary; los nice-to-have se suman si el alumno los tiene.

## Step 3 — Leer el base + el perfil + mapear el match

1. Leer el `.typ` base entero — es la fuente de contenido validado (experiencias, empresas, años, logros con métricas reales).
2. Leer `~/.coderhub/profile.md` — trae material que el CV base pudo haber dejado afuera (una tech secundaria, un logro, un proyecto) y que **es relevante a ESTA JD**. Acá está la munición para subir el match sin inventar.
3. Leer el método antes de reescribir (no se duplica — vive en cv-builder):
   - `${CLAUDE_SKILL_DIR}/../cv-builder/references/quality-bar.md` — foco en **§9** (adaptar a la JD: keywords 2→4 apariciones, reordenar, sin tocar estructura), **§10** (poner de más y defender, riesgo asimétrico), **§8** (coherencia: la tech va en los bullets, no solo en el header), **§5** (bullets resultado-no-objetivo), **§11** (anti-slop) y el **checklist final** (fechas exactas + render Typst).
   - `${CLAUDE_SKILL_DIR}/../cv-builder/references/typst-template.md` — API del package `silver-dev-cv` y el formato exacto de las funciones.
4. **Armar el mapa de match** (mental o en borrador): para cada keyword de la JD, ¿dónde está la evidencia en el base/perfil? Tres casos:
   - **Cubierta** → subirla de visibilidad (al header primero, a un bullet temprano).
   - **La tiene pero no está en el CV** (está en el perfil, o es una tech que "vio y entiende") → traerla e integrarla en un bullet real.
   - **Gap real** (no la tiene ni la puede defender) → NO inventarla; anotarla para el reporte de gaps (Step 6).

## Step 4 — Tailorear el contenido (exagerar lo defendible, no mentir)

Trabajar sobre una **copia** del base. Regla madre (quality-bar §10): el riesgo es asimétrico — poner de más y rebotar en la técnica es mejor que no aparecer en la búsqueda. Pero "poner de más" = re-enfocar y exagerar énfasis, **no** fabricar hechos. La línea: exagerar el *encuadre* y la *relevancia*; nunca la *existencia* de empresas, roles, años o métricas.

**Qué SÍ hacer:**
- **Summary/título:** reescribirlo para que el título espeje el **nombre de rol de la JD** (quality-bar §14: al nivel target, no al "seguro") y las primeras frases toquen sus top requirements. Es lo primero que leen el ATS y el humano.
- **Skills del header:** reordenar para que el stack que pide la JD vaya **primero** dentro de cada categoría. Sumar las keywords de la JD que el alumno tenga y falten (§10, defendibles).
- **Bullets:** reordenar dentro de cada experiencia para que lo relevante a la JD quede arriba. Reforzar las keywords de la JD de ~2 a ~4 apariciones **a lo largo del CV** (§9), metiéndolas en bullets reales — no como relleno. Re-enfocar los logros hacia los **outcomes que la JD valora** (si la JD grita "latencia/escala", el bullet de performance sube y se redacta hacia eso).
- **Exagerar el fit** dentro de lo defendible: elegir el ángulo más favorable de cada logro real, usar el vocabulario de la JD para nombrarlo, y sumar una tech que el alumno "vio y entiende" si la JD la pide (§10). Cuanto más cerca de la técnica pesa el requisito, más real tiene que ser lo que se pone.

**Qué NO tocar (quality-bar §9):**
- Estructura, formato, orden de secciones (más allá del reordenamiento interno de bullets/skills).
- Empresas, roles, **fechas/años**, títulos de las experiencias.
- Métricas reales (no inflar un 30% real a 80%). No inventar números.

**Mantener el quality bar del base:** bullets resultado-no-objetivo (§5), la tech en los bullets y no solo en el header (§8), y **anti-slop** (§11) — el impacto lo dan los números, no los adjetivos; nada de `at scale`, `proven track record`, `spearheaded`, etc.; máximo 1 em-dash por bullet.

## Step 5 — Generar el .typ nuevo, compilar y chequear el render

1. Escribir la copia tailoreada como **archivo nuevo** (nunca pisar el base):
   `~/.coderhub/cv/{slug}-cv-{jd-slug}.typ`
   donde `{slug}` es el nombre del alumno en kebab-case y `{jd-slug}` identifica la oferta (empresa o rol, kebab-case — ej. `stripe-backend`, `mercadolibre-tech-lead`).
2. Compilar:
   ```bash
   typst compile ~/.coderhub/cv/{slug}-cv-{jd-slug}.typ ~/.coderhub/cv/{slug}-cv-{jd-slug}.pdf
   ```
3. **Checks de render (quality-bar checklist) antes de dar por hecho:**
   - **Una sola página** (verificar; si se pasó, cortar ruido — no estirar). Para chequear el conteo: compilar a PNG con patrón `{n}` y contar los archivos frescos, o abrir el PDF.
   - **Fechas exactas** (mes + año, `MM/YYYY`) en toda experiencia y educación.
   - **Títulos de `#oneline-title-item` SIN `:` final** (el template ya agrega el `:` — si no, sale `Backend::`).
   - **Caracteres Typst escapados** en el contenido: `@ ~ $ #` (y `_` `*`) rompen o ensucian el compile. Ver Rules.
   - Si el compile falla, mostrar el error + el fragmento del `.typ` cercano, arreglar y reintentar (no devolver error crudo).
4. Copiar el PDF a `~/Downloads/` con nombre legible:
   ```bash
   cp ~/.coderhub/cv/{slug}-cv-{jd-slug}.pdf "$HOME/Downloads/{Nombre} - CV - {Rol o Empresa}.pdf"
   ```

## Step 6 — Reporte de match + confirmar

Mostrar, en este orden:

1. **Path del PDF** (absoluto) + que quedó en Downloads con el nombre legible.
2. **Match cubierto:** por cada keyword must-have de la JD, dónde quedó reflejada (header y/o qué bullet). Formato corto, escaneable.
3. **Gaps reales:** requisitos de la JD que el alumno NO tiene ni puede defender fácil. Para cada uno, una nota honesta: *"la JD pide X — no lo tenés en el perfil. Opciones: (a) lo dejamos afuera, (b) si lo tocaste algo lo sumamos y lo defendés en la técnica (riesgo asimétrico), (c) me contás y lo evaluamos."* Esto es criterio del alumno, no se decide por él.
4. **Recordatorio de defensa:** una línea — *"lo que 'pusimos de más' hay que poder defenderlo en la técnica; si querés, seguimos con `interview-prep` para este puesto."*

Cerrar ofreciendo:
```
¿Seguimos?
- "adaptá a esta otra oferta: {...}" → nueva versión
- "reforzá más X" / "sacá el énfasis en Y" → reajusto
- "preparame la entrevista de este puesto" → interview-prep
```

Si el alumno marca un problema con el output, corregir **y** actualizar `## Rules` (ver Self-Update).

## Rules

*Se actualizan cuando el alumno marca un problema. Leer antes de cada corrida.*

- **2026-09-07** — **Exagerar el encuadre, no fabricar hechos.** "Poner de más" (quality-bar §10) = re-enfocar logros reales hacia la JD, usar su vocabulario, sumar una tech que el alumno realmente "vio y entiende". NUNCA inventar empresas, roles, años ni métricas, ni inflar un número real (un 30% no se vuelve 80%). La línea: exagerar relevancia y ángulo; jamás la existencia de un hecho.
- **2026-09-07** — **Nunca pisar el CV base.** La salida SIEMPRE es un archivo nuevo `~/.coderhub/cv/{slug}-cv-{jd-slug}.typ`. El base (`{slug}-cv.typ`) es el material validado y no se toca.
- **2026-09-07** — **Sin JD no se corre.** Esta skill es específicamente para tailorear a una oferta. Si no hay JD, pedirla; si el alumno quiere un CV general, es `cv-builder`.
- **2026-09-07** — **No tocar estructura/empresas/roles/fechas/años** (quality-bar §9). El tailoreo es reordenar énfasis, reescribir summary y reforzar keywords — no reescribir la trayectoria.
- **2026-09-07** — **Checks de render heredados de cv-builder:** 1 página; fechas exactas (mes+año); `#oneline-title-item` sin `:` final; escapar `@ ~ $ #` (`@` rompe el compile, `~` mete espacios duros, `$` abre modo mate, `#` inicia código) — escapar con `\` o reformular. Chequear antes de dar el CV por hecho.
- **2026-09-07** — **Anti-slop igual que el base** (quality-bar §11): el impacto lo dan los números, no los adjetivos. Prohibido el relleno de resume/IA (`at scale`, `proven track record`, `spearheaded`, `deep expertise`, etc.); máximo 1 em-dash por bullet.
- **2026-09-07** — **Caso borde (poco común): JD de otra disciplina que el CV base.** El caso normal del alumno es dev que apunta a roles de dev → el tailoreo es reordenar + reforzar keywords sobre el mismo material. Pero a veces la JD es de otra disciplina que el CV base (ej. base de ingeniería → JD de ventas / PM / liderazgo). Ahí el CV base pudo haber dejado afuera a propósito experiencia relevante (cv-builder tiene la regla "el CV vende al ingeniero" y excluye emprendimientos/ventas/coaching). Para esa JD esa exclusión es incorrecta: traer esa experiencia REAL desde el perfil o desde lo que el alumno aporte, y si hace falta **agregar una entrada de experiencia** y reordenar cuál va primero según el rol objetivo (quality-bar §2). Sigue siendo experiencia real — no inventada; si faltan datos (fechas, métricas), pedirlos. Detectar este caso comparando la disciplina de la JD con la del CV base antes de asumir que solo hay que reordenar.

## Self-Update

Si el alumno flagea un problema (pisó el base, no cubrió una keyword clave, exageró algo indefendible, sintaxis Typst que rompe, un gap mal reportado), agregá una entrada con fecha de hoy a `## Rules` describiendo el fix, para que no se repita en la próxima oferta.

## Troubleshooting

- **No hay CV base** — `cv-tailor` no genera desde cero. Derivar a `/coderhub:cv-builder`, y una vez validado el base, volver con la JD.
- **`typst: command not found`** — no está instalado. Mac: `brew install typst`. Igual que `cv-builder`.
- **El compile falla** — casi siempre coma faltante, bullet mal armado, comillas/corchetes sin cerrar, o un `@`/`$`/`#` sin escapar que vino del base o del perfil. Mostrar el fragmento cercano, arreglar, reintentar.
- **Se pasó de 1 página** — el tailoreo agregó contenido. Cortar lo menos relevante a ESTA JD (para eso está el reordenamiento por relevancia); no estirar ni bajar la fuente.
- **La JD pide algo que el alumno no tiene** — no inventarlo. Reportarlo como gap (Step 6) y dejar la decisión al alumno.
- **El alumno quiere el CV en otro idioma** — si el base existe en ese idioma, tailorear sobre ese; si no, primero generar el base en ese idioma con `cv-builder` y después tailorear.
