---
name: adaptar-cv
description: Adapta un CV YA GENERADO (por armar-cv, en archivos-generados/cv/*.typ) a una Job Description específica, exagerando el fit dentro de lo defendible para maximizar el match con ese puesto. Reordena stack y bullets, reescribe el summary al rol de la oferta, refuerza las keywords de la JD y flaguea los gaps reales. Usá esta skill siempre que el alumno pegue una oferta/JD y quiera adaptar su CV a ese puesto, o diga "ajustá mi CV a esta oferta", "adaptá el CV a esta JD", "CV para esta búsqueda", "CV para este puesto", "tailoreá el CV", "hacé un CV para esta oferta", "/adaptar-cv". Requiere un CV base ya validado — si no existe ninguno en archivos-generados/cv/, deriva a armar-cv primero. NO es para generar el CV desde cero (eso es armar-cv) ni para preparar la entrevista (eso es preparar-entrevista). Requiere typst instalado. NO inventa empresas, roles ni años.
---

# CV Tailor

Toma el CV base ya validado del alumno y lo adapta a una oferta puntual: reordena el énfasis, reescribe el resumen al rol de la JD, sube las keywords que el puesto pide y empuja el fit hasta el límite de lo que se puede defender en la entrevista. Genera una **versión nueva** por oferta — nunca pisa el CV base.

La lógica detrás: un CV genérico compite mal. El mismo perfil, reordenado y redactado hacia una JD específica, pasa el filtro del ATS (keywords) y gana los 6-10 segundos del recruiter (match rápido). Este es el paso que casi nadie hace y el que más mueve la aguja por aplicación.

## Pre-requisitos

- **Un CV base en `archivos-generados/cv/*.typ`** (lo generó `armar-cv`). Si no hay ninguno → *"No encuentro un CV base tuyo. Generalo primero con `armar-cv` y después volvé con la oferta."* y parar. El CV base es el material validado; esta skill solo lo re-enfoca, no lo crea.
- **El texto de la JD.** Sin oferta, esta skill no tiene qué hacer — es `armar-cv` en modo general. Si el alumno no la pegó, pedirla (Step 2).
- **`typst` instalado** (`which typst`). Si falta, dar el hint y parar (ver Step 1).

## Outcome

- Una **copia tailoreada** del `.typ` base en `archivos-generados/cv/{slug}-cv-{jd-slug}.typ` (+ PDF con el mismo nombre), sin tocar el base.
- Copia del PDF en `~/Downloads/` con nombre legible: `{Nombre} - CV - {Rol o Empresa}.pdf`.
- Un **reporte de match**: qué keywords de la JD quedaron cubiertas y en qué bullet, y qué requisitos el alumno genuinamente no tiene (para que decida defenderlos o no).
- El alumno confirma y puede pedir otra oferta o más ajuste.

## Skill Relationships

- **Upstream (requerido):** `armar-cv` — genera el CV base validado que esta skill re-enfoca. Sin CV base, `adaptar-cv` no corre; deriva a `armar-cv`.
- **Límite con `armar-cv`:** `armar-cv` arma el CV **desde el perfil** (y opcionalmente lo tailorea *ligero* si le pasás una JD al momento de crearlo). `adaptar-cv` asume que el base **ya existe y está validado**, y va **más fuerte** con el match: reescribe summary, reordena todo hacia la JD, refuerza keywords y empuja el fit.
- **Sibling:** `preparar-entrevista` — una vez tailoreado el CV a un puesto, tiene sentido preparar la entrevista de ESE puesto (y defender lo que se "puso de más").
- **Sibling:** `optimizar-linkedin` — el CV tailoreado y el LinkedIn deben contar la misma historia.

## Step 1 — Validar CV base + typst

1. Listar los CV base disponibles:
   ```bash
   ls archivos-generados/cv/*.typ 2>/dev/null
   ```
   - **Ninguno** → derivar a `armar-cv` y parar (ver Pre-requisitos).
   - **Uno** → ese es el base.
   - **Varios** (ej. una versión ES y una EN, o versiones por rol) → preguntar cuál usar de base: *"Tenés varios CV. ¿Sobre cuál adapto? {lista}"*. Ignorar como candidatos los que ya son salidas tailoreadas previas (`*-cv-*.typ`) salvo que el alumno lo pida.
2. Chequear `typst`:
   ```bash
   which typst
   ```
   Si no está, dar el hint (Mac `brew install typst` / Windows `winget install Typst.Typst`) y parar — igual que `armar-cv`.

## Step 2 — Conseguir la JD + extraer keywords

1. **Conseguir el texto de la JD.** Si el alumno ya lo pegó, usarlo. Si pasó una URL, intentar leerla; si no se puede, pedir que pegue el texto. Si no pasó nada: *"Pegame el texto de la oferta (la JD completa: responsabilidades + requisitos). Con eso adapto el CV a ese puesto."* y esperar.
2. **Extraer las 5-7 keywords/skills que más pesan:** las que se repiten, las marcadas como *must-have / required*, el **nombre del rol** tal como lo escribe la JD, el **stack** principal, el **dominio** (fintech, health, infra, data, etc.) y las señales de seniority. Anotarlas — son el objetivo de todo el tailoreo.
3. Distinguir **must-have** (requisitos duros, "X años de", "required") de **nice-to-have** ("plus", "bonus", "nice to have"). Los must-have mandan el reordenamiento y el summary; los nice-to-have se suman si el alumno los tiene.

## Step 3 — Leer el base + el perfil + mapear el match

1. Leer el `.typ` base entero — es la fuente de contenido validado (experiencias, empresas, años, logros con métricas reales).
2. Leer `archivos-generados/perfil.md` — trae material que el CV base pudo haber dejado afuera (una tech secundaria, un logro, un proyecto) y que **es relevante a ESTA JD**. Acá está la munición para subir el match sin inventar.
3. Leer el método antes de reescribir (no se duplica — vive en armar-cv):
   - `.claude/skills/armar-cv/references/quality-bar.md` — foco en **§9** (adaptar a la JD: keywords 2→4 apariciones, reordenar, sin tocar estructura), **§10** (poner de más y defender, riesgo asimétrico), **§8** (coherencia: la tech va en los bullets, no solo en el header), **§5** (bullets resultado-no-objetivo), **§11** (anti-slop) y el **checklist final** (fechas exactas + render Typst).
   - `.claude/skills/armar-cv/references/typst-template.md` — API del package `silver-dev-cv` y el formato exacto de las funciones.
4. **Armar el mapa de match** (mental o en borrador): para cada keyword de la JD, ¿dónde está la evidencia en el base/perfil? Tres casos:
   - **Cubierta** → subirla de visibilidad (al header primero, a un bullet temprano).
   - **La tiene pero no está en el CV** (está en el perfil, o es una tech que "vio y entiende") → traerla e integrarla en un bullet real.
   - **Gap real** (no la tiene ni la puede defender) → NO inventarla; anotarla para el reporte de gaps (Step 6).

## Step 4 — Tailorear el contenido (exagerar lo defendible, no mentir)

Trabajar sobre una **copia** del base. Regla madre (quality-bar §10): el riesgo es asimétrico — poner de más y rebotar en la técnica es mejor que no aparecer en la búsqueda. Pero "poner de más" = re-enfocar y exagerar énfasis, **no** fabricar hechos. La línea: exagerar el *encuadre* y la *relevancia*; nunca la *existencia* de empresas, roles, años o métricas.

**Qué SÍ hacer:**
- **Summary/título:** reescribirlo para que el título espeje el **nombre de rol de la JD** (quality-bar §14: al nivel target, no al "seguro") y las primeras frases toquen sus top requirements.
- **Skills del header:** reordenar para que el stack que pide la JD vaya **primero** dentro de cada categoría. Sumar las keywords de la JD que el alumno tenga y falten (§10, defendibles).
- **Bullets:** reordenar dentro de cada experiencia para que lo relevante a la JD quede arriba. Reforzar las keywords de la JD de ~2 a ~4 apariciones **a lo largo del CV** (§9), metiéndolas en bullets reales — no como relleno. Re-enfocar los logros hacia los **outcomes que la JD valora**.
- **Exagerar el fit** dentro de lo defendible: elegir el ángulo más favorable de cada logro real, usar el vocabulario de la JD para nombrarlo, y sumar una tech que el alumno "vio y entiende" si la JD la pide (§10).

**Qué NO tocar (quality-bar §9):**
- Estructura, formato, orden de secciones (más allá del reordenamiento interno de bullets/skills).
- Empresas, roles, **fechas/años**, títulos de las experiencias.
- Métricas reales (no inflar un 30% real a 80%). No inventar números.

**Mantener el quality bar del base:** bullets resultado-no-objetivo (§5), la tech en los bullets y no solo en el header (§8), y **anti-slop** (§11).

## Step 5 — Generar el .typ nuevo, compilar y chequear el render

1. Escribir la copia tailoreada como **archivo nuevo** (nunca pisar el base):
   `archivos-generados/cv/{slug}-cv-{jd-slug}.typ`
   donde `{slug}` es el nombre del alumno en kebab-case y `{jd-slug}` identifica la oferta (empresa o rol, kebab-case — ej. `stripe-backend`, `mercadolibre-tech-lead`).
2. Compilar:
   ```bash
   typst compile archivos-generados/cv/{slug}-cv-{jd-slug}.typ archivos-generados/cv/{slug}-cv-{jd-slug}.pdf
   ```
3. **Checks de render (quality-bar checklist) antes de dar por hecho:**
   - **Una sola página** (verificar; si se pasó, cortar ruido — no estirar).
   - **Fechas exactas** (mes + año, `MM/YYYY`) en toda experiencia y educación.
   - **Títulos de `#oneline-title-item` SIN `:` final** (el template ya agrega el `:`).
   - **Caracteres Typst escapados** en el contenido: `@ ~ $ #` (y `_` `*`). Ver Rules.
   - Si el compile falla, mostrar el error + el fragmento del `.typ` cercano, arreglar y reintentar.
4. Copiar el PDF a `~/Downloads/` con nombre legible:
   ```bash
   cp archivos-generados/cv/{slug}-cv-{jd-slug}.pdf "$HOME/Downloads/{Nombre} - CV - {Rol o Empresa}.pdf"
   ```

## Step 6 — Reporte de match + confirmar

Mostrar, en este orden:

1. **Path del PDF** (dentro de `archivos-generados/cv/`) + que quedó en Downloads con el nombre legible.
2. **Match cubierto:** por cada keyword must-have de la JD, dónde quedó reflejada (header y/o qué bullet). Formato corto, escaneable.
3. **Gaps reales:** requisitos de la JD que el alumno NO tiene ni puede defender fácil. Para cada uno, una nota honesta: *"la JD pide X — no lo tenés en el perfil. Opciones: (a) lo dejamos afuera, (b) si lo tocaste algo lo sumamos y lo defendés en la técnica (riesgo asimétrico), (c) me contás y lo evaluamos."* Esto es criterio del alumno, no se decide por él.
4. **Recordatorio de defensa:** una línea — *"lo que 'pusimos de más' hay que poder defenderlo en la técnica; si querés, seguimos con `preparar-entrevista` para este puesto."*

Cerrar ofreciendo:
```
¿Seguimos?
- "adaptá a esta otra oferta: {...}" → nueva versión
- "reforzá más X" / "sacá el énfasis en Y" → reajusto
- "preparame la entrevista de este puesto" → preparar-entrevista
```

Si el alumno marca un problema con el output, corregir **y** actualizar `## Rules` (ver Self-Update).

## Rules

*Se actualizan cuando el alumno marca un problema. Leer antes de cada corrida.*

- **2026-09-07** — **Exagerar el encuadre, no fabricar hechos.** "Poner de más" (quality-bar §10) = re-enfocar logros reales hacia la JD, usar su vocabulario, sumar una tech que el alumno realmente "vio y entiende". NUNCA inventar empresas, roles, años ni métricas, ni inflar un número real. La línea: exagerar relevancia y ángulo; jamás la existencia de un hecho.
- **2026-09-07** — **Nunca pisar el CV base.** La salida SIEMPRE es un archivo nuevo `archivos-generados/cv/{slug}-cv-{jd-slug}.typ`. El base (`{slug}-cv.typ`) es el material validado y no se toca.
- **2026-09-07** — **Sin JD no se corre.** Esta skill es específicamente para tailorear a una oferta. Si no hay JD, pedirla; si el alumno quiere un CV general, es `armar-cv`.
- **2026-09-07** — **No tocar estructura/empresas/roles/fechas/años** (quality-bar §9). El tailoreo es reordenar énfasis, reescribir summary y reforzar keywords — no reescribir la trayectoria.
- **2026-09-07** — **Checks de render heredados de armar-cv:** 1 página; fechas exactas (mes+año); `#oneline-title-item` sin `:` final; escapar `@ ~ $ #` — escapar con `\` o reformular.
- **2026-09-07** — **Anti-slop igual que el base** (quality-bar §11): el impacto lo dan los números, no los adjetivos. Máximo 1 em-dash por bullet.
- **2026-09-07** — **Caso borde (poco común): JD de otra disciplina que el CV base.** El caso normal es dev que apunta a roles de dev → el tailoreo es reordenar + reforzar keywords sobre el mismo material. Pero a veces la JD es de otra disciplina (ej. base de ingeniería → JD de ventas / PM / liderazgo). Ahí el CV base pudo haber dejado afuera a propósito experiencia relevante (armar-cv excluye emprendimientos/ventas/coaching). Para esa JD esa exclusión es incorrecta: traer esa experiencia REAL desde el perfil o desde lo que el alumno aporte, y si hace falta **agregar una entrada de experiencia** y reordenar cuál va primero (quality-bar §2). Sigue siendo experiencia real — no inventada; si faltan datos, pedirlos.

## Self-Update

Si el alumno flagea un problema (pisó el base, no cubrió una keyword clave, exageró algo indefendible, sintaxis Typst que rompe, un gap mal reportado), agregá una entrada con fecha de hoy a `## Rules` describiendo el fix.

## Troubleshooting

- **No hay CV base** — `adaptar-cv` no genera desde cero. Derivar a `armar-cv`, y una vez validado el base, volver con la JD.
- **`typst: command not found`** — no está instalado. Mac: `brew install typst`.
- **El compile falla** — casi siempre coma faltante, bullet mal armado, comillas/corchetes sin cerrar, o un `@`/`$`/`#` sin escapar. Mostrar el fragmento cercano, arreglar, reintentar.
- **Se pasó de 1 página** — cortar lo menos relevante a ESTA JD; no estirar ni bajar la fuente.
- **La JD pide algo que el alumno no tiene** — no inventarlo. Reportarlo como gap (Step 6) y dejar la decisión al alumno.
- **El alumno quiere el CV en otro idioma** — si el base existe en ese idioma, tailorear sobre ese; si no, primero generar el base en ese idioma con `armar-cv`.
