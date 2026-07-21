# Setup técnico

## 1. Claude Code

Instalá **Claude Code** desde [claude.com/claude-code](https://claude.com/claude-code).

Es la CLI oficial de Anthropic. Una vez instalado, abrí una terminal en la carpeta de este repo:

```bash
cd ~/coderhub   # o donde lo hayas clonado
claude
```

## 2. Cargar las skills

Las skills de este repo viven en `claude-skills/`. Tenés 2 formas de usarlas:

### Opción A — Cargarlas globales (recomendado)

```bash
# Crear la carpeta global de skills si no existe
mkdir -p ~/.claude/skills

# Linkear (o copiar) las skills al directorio global
ln -s "$(pwd)/claude-skills/coderhub-setup" ~/.claude/skills/
ln -s "$(pwd)/claude-skills/linkedin-profile-optimizer" ~/.claude/skills/
ln -s "$(pwd)/claude-skills/linkedin-feed-job-hunter" ~/.claude/skills/
```

Las skills van a estar disponibles en cualquier proyecto donde uses Claude Code.

### Opción B — Solo dentro del repo

No hagas nada extra. Cuando corrés `claude` dentro de la carpeta del repo, Claude detecta `claude-skills/` automáticamente.

## 3. Configurar tu perfil (correr 1 sola vez)

```bash
cd ~/coderhub
claude
```

Adentro de Claude:

```
/coderhub-setup
```

Te va a pedir transcripción de la call de discovery con CoderHub, o tu CV + perfil de LinkedIn. Con eso llena `profile-template/profile.md` automáticamente.

## 4. Usar las skills

Una vez que tu perfil está configurado, tirá comandos en lenguaje natural:

```
optimizá mi LinkedIn
```

```
buscá en mi feed de LinkedIn ofertas que matcheen y aplicá
```

Claude usa las skills correspondientes con tus datos.

---

## MCPs opcionales (recomendados pero no obligatorios)

Algunas skills mejoran si tenés estos MCPs configurados:

- **Gmail MCP** — para que las skills manden emails directo (sin copiar-pegar). Setup: ver docs de Anthropic.
- **LinkedIn MCP / browser MCP** — para que las skills puedan leer tu feed sin pasarle screenshots.

Si no los tenés, las skills siguen funcionando — solo que algunos pasos los hacés vos a mano (copy-paste, mandar email desde Gmail web, etc.).

---

## Problemas comunes

**"No me detecta las skills"** — verificá que estés ejecutando `claude` desde la carpeta del repo (Opción B) o que el symlink global exista (Opción A).

**"La skill me pide datos que ya cargué"** — probablemente no corriste `coderhub-setup`. Corrélo primero para llenar `profile.md`.

**Cualquier otra cosa** — pegame un WhatsApp.
