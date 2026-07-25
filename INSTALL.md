# Setup técnico

## 1. Claude Code

Instalá **Claude Code** desde [claude.com/claude-code](https://claude.com/claude-code).

Es la CLI oficial de Anthropic. Una vez instalado, abrí una terminal en la carpeta de este repo:

```bash
cd ~/coderhub   # o donde lo hayas clonado
claude
```

## 2. Inicializar el repo

Corré el instalador una sola vez desde la raíz del repo:

```bash
cd ~/coderhub   # o donde lo hayas clonado
./install.sh
```

Es idempotente (podés correrlo las veces que quieras) y hace dos cosas:

1. **Instala las skills** en `~/.claude/skills` (symlinks que apuntan a este repo — si editás una skill, el cambio se refleja al toque). Quedan disponibles en cualquier proyecto donde uses Claude Code.
2. **Crea `my-profile/`** con tu perfil personal, copiado del template en blanco. Esta carpeta está gitignoreada — tus datos (teléfono, salario) nunca se commitean.

Reiniciá `claude` para que tome las skills recién instaladas.

## 3. Configurar tu perfil (correr 1 sola vez)

```bash
cd ~/coderhub
claude
```

Adentro de Claude:

```
/coderhub-setup
```

Te va a pedir transcripción de la call de discovery con CoderHub, o tu CV + perfil de LinkedIn. Con eso llena `my-profile/profile.md` automáticamente. Si todavía no corriste `install.sh`, la propia skill lo detecta y lo corre por vos.

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

**"No me detecta las skills"** — corré `./install.sh` y reiniciá `claude`. Verificá que existan los symlinks en `~/.claude/skills/`.

**"La skill me pide datos que ya cargué"** — probablemente no corriste `coderhub-setup`. Corrélo primero para llenar `my-profile/profile.md`.

**Cualquier otra cosa** — pegame un WhatsApp.
