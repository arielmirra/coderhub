---
name: github-readme-builder
description: Genera (o rehace) el profile README de GitHub del cliente — el repo especial usuario/usuario que se muestra arriba del perfil, como landing page profesional. Lee perfil/profile.md + trae los proyectos y la actividad reales del GitHub del cliente (vía gh api) y arma un README que POSICIONA: hero con qué construís y para quién, value prop con números, stack curado, proyectos con outcome (la prueba), y contacto. Corta la decoración (typing SVG, visitor counters, snake, trophy, gifs de "Hi") y prioriza señal. Triggers on "mejorá mi README de GitHub", "armá mi profile README", "hacé mi README de perfil", "/github-readme-builder", "optimizá mi GitHub", "readme de github", "perfil de github". Coherente con el CV y el LinkedIn (misma historia). NO es para READMEs de proyectos/repos (eso es otra cosa) — es específicamente para el perfil.
---

# GitHub Profile README Builder

Arma el **profile README** del cliente (el repo especial `usuario/usuario`) como **landing page profesional**: posicionamiento arriba, proyectos reales como prueba, cero decoración. Tono: seguí `voz.md`.

## Pre-requisitos

- `perfil/profile.md` lleno (corrió `coderhub-setup`). Si está sin llenar → *"No encuentro tu perfil cargado. Corré primero `coderhub-setup`."* y parar.
- **Usuario de GitHub** del cliente (está en el profile; si no, preguntarlo). Con `gh` disponible o la API pública se traen los proyectos reales.

## Outcome

- Un `README.md` de perfil listo para pegar en el repo `usuario/usuario`, guardado en `trabajo/github/{YYYY-MM-DD}_readme-perfil.md`.
- Sigue el método CoderHub: hero de posicionamiento, value prop con números, stack curado (4-6), **proyectos con outcome** (la estrella), connect compacto, personalidad opcional en `<details>`.
- Instrucciones para deployarlo (crear/pushear el repo especial).
- Coherente con el CV y el LinkedIn del cliente.

## Skill Relationships

- **Upstream:** `coderhub-setup` — genera el `perfil/profile.md` que esta skill consume.
- **Sibling:** `cv-builder` y `linkedin-profile-optimizer` — el README, el CV y el LinkedIn cuentan la **misma historia** (mismo rol target, mismos logros con números, mismo stack priorizado).

## Step 1 — Leer el profile + la quality bar

1. Leer `perfil/profile.md`. Extraer: identidad (nombre, usuario de GitHub, links), rol + años, stack (principal + AI si usa), logros con números, objetivo de búsqueda (rol target), diferenciadores.
2. **Leer `.claude/skills/github-readme-builder/references/quality-bar.md` antes de generar** — es el "qué sí / qué no / por qué" (profile vs project README, el hero de posicionamiento, proyectos como prueba, señal vs decoración, anti-patterns). Es el nivel a igualar.
3. Si falta el usuario de GitHub, preguntarlo.

## Step 2 — Traer los proyectos y la actividad reales

GitHub es fuente **gratis y sin setup** (API pública / `gh`). Traé material real — no inventes proyectos.

```bash
gh api users/{usuario} --jq '"desde \(.created_at[0:10]) · repos:\(.public_repos) · followers:\(.followers)"'
gh api "users/{usuario}/repos?sort=pushed&per_page=100" --jq 'sort_by(-.stargazers_count)[] | select(.fork==false) | "\(.name) ⭐\(.stargazers_count) · \(.language // "?") · \(.description // "")· \(.html_url)"'
```

**Curá estratégicamente (quality-bar §4):** elegí **3-8 proyectos** — los que tienen estrellas, un producto real/deployado, o son relevantes al **rol target** (un proyecto de AI/agentes hoy es diferencial fuerte). **NUNCA** dumpear todos ni listar sandboxes de aprendizaje/tutoriales (señalizan junior). Si un repo relevante no tiene descripción, inferí qué resuelve de su contenido o preguntale al cliente — no inventes el outcome.

Si el cliente **no tiene proyectos públicos fuertes**, no forzar la sección: apoyarse más en value prop + experiencia + (si escribe) un feed de blog.

## Step 3 — Detectar idioma + arquetipo

- **Idioma:** según el rol target del profile (US/Global → inglés; LATAM hispano → español; mixto → inglés, que es el default de GitHub). No mezclar.
- **Arquetipo (quality-bar §7):** por default **Descriptive + Projects curados + Badges seleccionados** (+ toque Minimalistic). Evitar "A Little Bit of Everything". Solo sumar un **auto-feed** (blog/releases) si el cliente tiene contenido real que mostrar (§6).

## Step 4 — Escribir el README (por bloques)

Seguí la estructura canónica (quality-bar §2), parametrizada con los datos reales:

1. **Hero** — posicionamiento en 1 línea: *qué construís + para quién + diferenciador*. NO "Hi 👋", NO typing SVG. (Opcional: banner con el tagline.)
2. **Value prop** (blockquote) — 2-3 frases con al menos **un número** + rol actual + qué shippeás.
3. **Stack** — 4-6 badges shields.io del stack **real** (incluí AI si aplica). No 20.
4. **Proyectos** — 3-8 curados. Cada uno: `**[nombre](link)**` + tag (`open source`/`private`) + qué resuelve (1 línea) + outcome/número + *stack en itálica*. El reframe *"Not a X. A Y."* solo en los 2-3 que lo merecen.
5. **Experiencia** (opcional) — rol/empresa actual con link + 1 línea.
6. **Connect** — fila compacta de badges: LinkedIn, portfolio, email, CV.
7. **Personalidad** (opcional) — random facts en `<details>` + quote de cierre.

**Confirmar bloque por bloque** con el cliente (sobre todo el hero y qué proyectos entran) — es su marca personal.

## Step 5 — Humanizar (anti-slop)

Antes de entregar, pasá el texto por el filtro anti-slop (quality-bar §8, igual que CV §11 / LinkedIn §11): fuera "passionate about", "always learning", slogans genéricos. Cada frase tiene que decir algo específico o se va. Cero decoración (typing, visitor counter, snake, trophy, spotify, memes, gifs de bienvenida).

## Step 6 — Guardar + instrucciones de deploy

1. Guardar en `trabajo/github/{YYYY-MM-DD}_readme-perfil.md` (crear `trabajo/github/` si no existe). Mostrar la ruta.
2. Dar las instrucciones de deploy:
   ```
   Para que se muestre en tu perfil, el archivo va en un repo especial con TU MISMO nombre de usuario:
   1. Creá el repo público  github.com/{usuario}/{usuario}
   2. Pegá este contenido como README.md en la raíz
   3. Commit → aparece arriba de tu perfil al instante
   ```
   (Si ya existe el repo, es reemplazar el README.md actual.)
3. Recordar la **coherencia**: que el rol target y los logros matcheen su CV y su LinkedIn.

## Rules

*Se actualizan cuando el cliente marca un problema. Leer antes de cada corrida.*

- **2026-09-20** — **Profile README ≠ project README.** Nada de installation/usage/contributing/license/coverage/TOC. Es una landing page profesional: posicionamiento + prueba + contacto.
- **2026-09-20** — **Hero = posicionamiento, no saludo.** Prohibido "Hi 👋 welcome to my profile" y typing SVG genérico. Primera línea = qué construís + para quién + diferenciador.
- **2026-09-20** — **Los proyectos son la prueba y salen del GitHub real.** Curar 3-8 (calidad > catálogo), cada uno con link + outcome + stack. Nunca inventar proyectos ni outcomes; nunca dumpear sandboxes/tutoriales.
- **2026-09-20** — **Señal, no decoración.** Fuera visitor counters, typing SVG, snake, trophy, spotify, memes, gifs de bienvenida, fancy fonts. Stack = 4-6 badges reales, no 20. Si un widget solo se explica como "es lindo", va afuera.
- **2026-09-20** — **Coherencia con CV + LinkedIn.** Mismo rol target, mismos logros con números, mismo stack priorizado.
- **2026-09-20** — **Anti-slop.** Cero "passionate about" / "always learning" / slogans genéricos.

## Self-Update

Si el cliente flagea un problema (metí un proyecto flojo, quedó decoración de más, el hero salió genérico, idioma equivocado), agregá una entrada con fecha de hoy a `## Rules` describiendo el fix.

## Troubleshooting

- **No tiene proyectos públicos fuertes** — no forzar la sección; apoyarse en value prop + experiencia + feed de blog si escribe. Un README conciso y bien posicionado le gana a uno lleno de repos flojos.
- **`gh` no está / no logueado** — usar la API pública (`https://api.github.com/users/{usuario}/repos`) o pedirle al cliente que pegue sus proyectos destacados.
- **El README no aparece en el perfil** — el repo tiene que llamarse EXACTO igual que el usuario y ser **público**, con el `README.md` en la raíz.
