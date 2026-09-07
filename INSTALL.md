# Instalación — CoderHub Tooling

Guía para dejar el tooling andando en tu compu. Toma 5 minutos, se hace una sola vez.

---

## 1. Requisitos

- **Claude Code** — la CLI oficial de Anthropic. Bajala de [claude.com/claude-code](https://claude.com/claude-code) e instalala. **Ojo: es Claude Code, no la app de escritorio de Claude** — los plugins solo corren en Claude Code.
  - **En Windows:** instalá también [Git for Windows](https://git-scm.com/download/win) (Claude Code usa Git Bash para correr los comandos) — o usá [WSL](https://learn.microsoft.com/windows/wsl/install). Con cualquiera de las dos, todo funciona igual que en Mac, y tu perfil queda en `C:\Users\TuUsuario\.coderhub`.
- **typst** (solo para el CV) — el compilador que arma tu CV en PDF.
  - Mac: `brew install typst`
  - Windows: `winget install Typst.Typst` (o `scoop install typst`)
  - Linux: ver [typst.app](https://github.com/typst/typst?tab=readme-ov-file#installation)
  - Si no lo instalás, todo lo demás funciona igual — solo `cv-builder` te va a pedir que lo instales cuando lo uses.

MCPs opcionales (mejoran algunas skills, no son obligatorios): Apify o browser MCP para leer tu LinkedIn/feed sin copiar-pegar, Gmail MCP para mandar mails directo. Sin ellos las skills siguen andando — algunos pasos los hacés a mano.

---

## 2. Instalar el plugin

Abrí Claude Code en cualquier carpeta y corré adentro:

```
/plugin marketplace add arielmirra/coderhub
/plugin install coderhub@coderhub
```

- La primera línea registra el marketplace de CoderHub (un repo de GitHub).
- La segunda instala el plugin `coderhub`. Elegí scope **user** cuando te pregunte — así las skills están disponibles en cualquier proyecto.

Las skills quedan disponibles con el prefijo `coderhub:` — por ejemplo `/coderhub:coderhub-setup`.

---

## 3. Configurar tu perfil (una sola vez)

```
/coderhub:coderhub-setup
```

Te va a pedir la transcripción de tu call de discovery con CoderHub, o tu CV + perfil de LinkedIn. Con eso llena tu perfil automáticamente en **`~/.coderhub/profile.md`** — un archivo local a tu máquina que **nunca se sube a ningún lado** (ahí viven tus datos: teléfono, salario, etc.).

Todas las demás skills leen ese perfil, así que este paso va primero.

> Si sos alumno de CoderHub, es posible que el equipo ya te haya armado el `profile.md` desde tu call y tu LinkedIn — en ese caso `coderhub-setup` te lo muestra para que lo confirmes en vez de tipear todo.

---

## 4. Usar las skills

Tirá comandos en lenguaje natural — Claude elige la skill:

| Querés... | Decile algo como... |
|---|---|
| Optimizar tu LinkedIn para recruiters | "optimizá mi LinkedIn" |
| Aplicar a ofertas de tu feed | "buscá ofertas en mi feed y aplicá" |
| Prepararte para una entrevista | "preparame para esta entrevista" (+ pegás el job posting) |
| Armar tu CV en PDF | "armame el CV" (o tailorearlo a una oferta) |

---

## 5. Actualizaciones

Cuando CoderHub actualiza el tooling, lo bajás con:

```
/plugin marketplace update coderhub
/reload-plugins
```

---

## Problemas comunes

- **"No me detecta las skills"** — corré `/reload-plugins`, o reiniciá `claude`. Verificá con `/plugin` que `coderhub` figure instalado.
- **"typst: command not found" al armar el CV** — instalá typst (ver Requisitos). El resto de las skills no lo necesitan.
- **"La skill me pide datos que ya cargué"** — corré `/coderhub:coderhub-setup` primero para llenar `~/.coderhub/profile.md`.
- **Cualquier otra cosa** — pegame un WhatsApp.

— Ariel
