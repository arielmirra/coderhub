# Design spec — banners de perfil (método CoderHub)

Cómo se ve un buen banner de perfil (LinkedIn + GitHub) y por qué. Se generan con **typst** (determinístico, texto perfecto, exporta PNG a dimensiones exactas) — NO con IA generativa de imágenes (destroza el texto y sale inconsistente). Mismo principio que el sistema de HTML de onboarding: controlar el output.

> Coherencia: el banner refuerza el MISMO posicionamiento que el CV, el LinkedIn y el README. Ver las quality-bars de `linkedin-profile-optimizer` (§3 banner) y `github-readme-builder`.

---

## 1. Dimensiones exactas

| Destino | Tamaño nominal | Ratio | Cómo se renderiza |
|---|---|---|---|
| **LinkedIn** | **1584 × 396 px** | 4:1 | typst page `1584pt × 396pt`, exportar `--ppi 144` → 3168×792 (2× para nitidez retina; LinkedIn lo baja). |
| **GitHub README** | **1280 × 320 px** | 4:1 | typst page `1280pt × 320pt`, `--ppi 144` → 2560×640. Se commitea como `assets/banner.png` y se referencia en el README. |

typst en `--ppi 144`: los px del PNG = (tamaño en pt) × 2. Siempre exportar a 2× y dejar que la plataforma baje.

## 2. Safe zones (CRÍTICO en LinkedIn)

LinkedIn recorta el banner distinto según dispositivo → hay zonas donde el contenido se pierde:

- **Foto de perfil (desktop):** un círculo se superpone sobre el **borde inferior-izquierdo** del banner. **NADA crítico ahí** (ni el nombre ni la primera línea del stack).
- **Mobile:** recorta los **lados**; solo se ve una banda central (~60% del ancho). El contenido clave no debe pegarse a los bordes izquierdo/derecho.
- **Regla de composición:** contenido **centrado verticalmente**, con margen horizontal generoso (~90-110pt), y el bloque de texto arrancando después del área de la foto. Preferir que lo esencial (nombre + rol) viva en la **franja media**, no en el tercio inferior.

GitHub no tiene foto superpuesta ni crop agresivo → más libertad, pero igual centrar y dar aire.

## 3. Estética (default técnico)

Paleta on-brand (misma que el sistema CoderHub), fondo oscuro = se ve "de ingeniero", no de RRHH:

- **Fondo:** navy profundo `#0A1628`.
- **Acento:** azul `#0099FF` / `#27B2FF` (eyebrow, chips, barra).
- **Texto:** `#E8EEF6` (título) + `#9FB3C8` (subtítulo muted).
- **Tipografía:** sans para el nombre (bold, grande); **mono** para eyebrow y chips del stack (da el toque técnico). Fallbacks portables: sans `("Helvetica Neue","Arial","Liberation Sans")`, mono `("Menlo","DejaVu Sans Mono","Courier New")`.
- **Acento visual sutil:** una barra vertical azul a la izquierda del texto, o un grid/dots tenue. **Nada de** clip-art, gradientes chillones, ni stock photos.

## 4. Contenido (qué va)

Jerarquía, de arriba a abajo:

1. **Eyebrow (mono, tracking amplio):** rol + empresa/seniority. Ej. `SENIOR SOFTWARE ENGINEER @ SALESFORCE`.
2. **Nombre (sans, grande, bold):** el nombre de la persona. Es el ancla.
3. **Tagline (muted):** una línea de qué hace / diferenciador. Ej. `Backend systems & developer tooling at scale — AI-native`.
4. **Stack (mono, acento):** 6-9 tecnologías reales separadas por `·`, **incluida AI** si aplica (Claude Code · MCP). Es lo que refuerza keywords y da el "con onda" que pide la quality-bar de LinkedIn.

**Idioma:** inglés por default (igual que el README — superficie global/profesional). El LinkedIn banner puede ir en el idioma del target del cliente si apunta 100% a un mercado hispano; ante la duda, inglés.

## 5. Señal, no decoración (igual que README/LinkedIn)

- ✅ Nombre, rol, tagline con un diferenciador, stack real.
- ❌ Frases genéricas ("passionate developer", "welcome to my profile"), emojis de más, íconos de stack de tecnologías que no domina, fondos recargados.
- El banner es **posicionamiento visual**, no un afiche. Menos es más: se lee en 2 segundos.

## 6. Anti-patterns

- Contenido en la esquina inferior-izquierda (lo tapa la foto en LinkedIn).
- Texto pegado a los bordes (se recorta en mobile).
- El azul default de LinkedIn / banner en blanco vacío.
- Meter el logo de la empresa actual (a menos que sume) o datos de contacto largos.
- Stack de 15 tecnologías (satura); curar a 6-9.
- Sansserif + mono mal contrastados o fuentes que no existen en la máquina → verificar que compile.

## Checklist

- [ ] ¿Dimensión y ratio correctos por destino (LinkedIn 1584×396, GitHub 1280×320), exportado 2×?
- [ ] ¿Contenido centrado vertical, lejos de la esquina inferior-izq (foto) y de los bordes (mobile)?
- [ ] ¿Eyebrow (rol) + nombre + tagline + stack real (incluida AI)?
- [ ] ¿Fondo oscuro on-brand, mono para lo técnico, cero decoración?
- [ ] ¿Inglés (default)? ¿Coherente con CV/LinkedIn/README?
- [ ] ¿Compiló sin fuentes faltantes? ¿Se ve nítido a tamaño real?
