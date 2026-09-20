---
name: banner-builder
description: Genera banners de perfil profesionales para el cliente — el banner de LinkedIn (1584×396) y el banner del README de GitHub (1280×320) — a partir de perfil/profile.md, con estética técnica on-brand (fondo oscuro, nombre + rol + stack real incluida AI). Usa typst para renderizar PNG a dimensiones exactas (texto perfecto, no IA de imágenes). Respeta las safe zones de LinkedIn (foto de perfil + crop mobile). Triggers on "armá mi banner", "banner de LinkedIn", "banner para el github", "portada de LinkedIn", "generá mi banner", "/banner-builder", "hacé el banner del perfil", "necesito una portada". Requiere typst instalado (la misma dependencia que cv-builder). Complementa a linkedin-profile-optimizer (que recomienda el banner) y github-readme-builder (que lo embebe).
---

# Banner Builder

Genera los banners de perfil del cliente — **LinkedIn** (el prioritario) y **GitHub README** — con estética técnica on-brand. Renderiza con **typst** a PNG de dimensiones exactas: texto perfecto, determinístico, editable (NO IA generativa de imágenes, que arruina el texto). Tono: seguí `voz.md`.

## Pre-requisitos

- `perfil/profile.md` lleno (corrió `coderhub-setup`). Si no → derivar a `coderhub-setup` y parar.
- **`typst` instalado** (misma dependencia que `cv-builder`). Si `which typst` falla → dar el hint (`brew install typst` / `winget install Typst.Typst`) y parar.

## Outcome

- **Banner de LinkedIn** en `trabajo/linkedin/{YYYY-MM-DD}_banner-linkedin.png` (1584×396, exportado 2× para nitidez).
- **Banner de GitHub** en `trabajo/github/assets/banner.png` (1280×320) + el snippet markdown para embeberlo arriba del README.
- Instrucciones para subir cada uno (LinkedIn: editar portada; GitHub: commitear el asset).
- Coherente con el CV, el LinkedIn y el README del cliente (mismo posicionamiento).

## Skill Relationships

- **Upstream:** `coderhub-setup` — genera el `perfil/profile.md`.
- **Sibling:** `linkedin-profile-optimizer` — recomienda el banner (§3); esta skill lo **produce**. `github-readme-builder` — embebe el banner de GitHub arriba del README.

## Step 1 — Leer profile + design spec

1. Leer `perfil/profile.md`: nombre, rol + seniority + empresa (para el eyebrow), stack real (principal + AI), diferenciador (para la tagline), rol target.
2. **Leer `.claude/skills/banner-builder/references/design-spec.md`** — dimensiones exactas, **safe zones de LinkedIn** (crítico), estética, contenido, anti-patterns. Es el nivel a igualar.
3. Chequear `typst` (`which typst`); si falta, hint + parar.

## Step 2 — Definir el contenido

De `profile.md`, armar los 4 bloques (design-spec §4):
- **Eyebrow (mono):** `{ROL SENIORITY} @ {EMPRESA}` o `{ROL} · {AÑOS}+ YRS` si no hay empresa a mostrar.
- **Nombre:** el nombre de la persona.
- **Tagline:** una línea de qué hace + diferenciador (no genérica — nada de "passionate developer").
- **Stack (mono):** 6-9 tecnologías reales separadas por ` · `, **incluida AI** si aplica (Claude Code · MCP).

**Idioma:** inglés por default (superficie global). Español solo si el cliente apunta 100% a mercado hispano.

Confirmar el contenido con el cliente antes de renderizar (es su marca).

## Step 3 — Renderizar el banner de LinkedIn (prioritario)

1. Copiar `.claude/skills/banner-builder/references/banner-template.typ` a `trabajo/linkedin/{slug}-banner.typ` y reemplazar los placeholders (`//{{EYEBROW}}`, `//{{NAME}}`, `//{{TAGLINE}}`, `//{{STACK}}`). Dejar `W=1584pt H=396pt`.
2. **Escapar los caracteres typst** en el contenido (`@ ~ $ # _ *` → con `\`). Ej: `\@ SALESFORCE`.
3. Compilar a 2×:
   ```bash
   typst compile trabajo/linkedin/{slug}-banner.typ trabajo/linkedin/{YYYY-MM-DD}_banner-linkedin.png --ppi 144
   ```
4. **Verificar el render:** que el PNG mida 3168×792, que ningún texto quede en la esquina inferior-izquierda (safe zone de la foto) ni pegado a los bordes (crop mobile). Si algo se sale, ajustar tamaños/spacing y recompilar. Si el compile falla por fuente, revisar los fallbacks del template.

## Step 4 — Renderizar el banner de GitHub

1. Copiar el mismo `.typ`, cambiar `W=1280pt H=320pt` (y bajar el nombre a ~60pt si hace falta que entre).
2. Compilar a `trabajo/github/assets/banner.png` con `--ppi 144` (→ 2560×640).
3. Dar el snippet para el README:
   ```markdown
   <p align="center"><img src="./assets/banner.png" alt="{Nombre} — {rol}" width="100%"/></p>
   ```

## Step 5 — Entregar + deploy

Mostrar las rutas de los dos PNG y las instrucciones:
- **LinkedIn:** perfil → editar → cámara en la portada → subir `{fecha}_banner-linkedin.png`. Previsualizar en desktop Y mobile antes de guardar.
- **GitHub:** commitear `assets/banner.png` en el repo `usuario/usuario` y pegar el snippet arriba del README.

Ofrecer ajustes (paleta, tagline, más/menos stack). Si el cliente marca un problema, corregir **y** actualizar `## Rules`.

## Rules

*Se actualizan cuando el cliente marca un problema. Leer antes de cada corrida.*

- **2026-09-20** — **typst, no IA de imágenes.** Los banners tienen texto (nombre, rol, stack) → la IA generativa lo arruina. Render determinístico con typst, texto perfecto.
- **2026-09-20** — **Safe zones de LinkedIn.** Nada crítico en la esquina inferior-izquierda (foto de perfil desktop) ni pegado a los bordes (crop mobile). Contenido centrado vertical, margen horizontal generoso.
- **2026-09-20** — **Dimensiones exactas + 2×.** LinkedIn 1584×396, GitHub 1280×320, exportar `--ppi 144` (2×) para nitidez. Verificar dims del PNG.
- **2026-09-20** — **Señal, no decoración.** Fondo oscuro on-brand, nombre + rol + tagline + stack real (incluida AI). Cero frases genéricas, cero clip-art, cero azul default de LinkedIn.
- **2026-09-20** — **Coherencia + inglés default.** Mismo posicionamiento que CV/LinkedIn/README; inglés salvo target 100% hispano.

## Self-Update

Si el cliente flagea un problema (texto en zona recortada, fuente que no compiló, stack saturado, tagline genérica), agregá una entrada con fecha de hoy a `## Rules`.

## Troubleshooting

- **`typst: command not found`** — instalarlo (igual que cv-builder). Mac: `brew install typst`.
- **Fuente faltante / banner con tofu (□)** — la máquina no tiene la fuente; el template ya trae fallbacks (`Helvetica Neue`/`Arial`, `Menlo`/`DejaVu Sans Mono`). Si aún falla, usar una fuente que `typst fonts` liste.
- **El texto se pisa con la foto en LinkedIn** — subir el bloque a la franja media / achicar el stack; recompilar y previsualizar.
- **El compile falla** — casi siempre un `@`/`#`/`$`/`_` sin escapar en el contenido. Escapar con `\` y reintentar.
