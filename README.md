# CoderHub Tooling

Caja de herramientas técnicas para correr en tu compu. Complemento a la mentoría y a los módulos de Skool — Skool tiene la teoría y los videos, este plugin tiene **el código que automatiza tu búsqueda**.

---

## ¿Qué es esto?

Un **plugin de Claude Code** con skills, prompts y scripts para que Claude trabaje por vos en distintas partes del proceso de búsqueda laboral. La idea: instalás el plugin una vez, configurás tu perfil, y de ahí en adelante le tirás comandos a Claude para que haga el trabajo pesado.

---

## Casos de uso

| Quiero... | Skill |
|---|---|
| Configurar mis datos para que las skills me conozcan | `coderhub:coderhub-setup` |
| Optimizar mi perfil de LinkedIn para aparecer en búsquedas de recruiters | `coderhub:linkedin-profile-optimizer` |
| Aplicar automáticamente a ofertas que aparecen en mi feed | `coderhub:linkedin-feed-job-hunter` |
| Prepararme para una entrevista en 15m o 1h | `coderhub:interview-prep` |
| Armar mi CV en PDF con mi data | `coderhub:cv-builder` |

Más skills se van sumando — el plugin se actualiza periódicamente (`/plugin marketplace update coderhub`).

---

## Cómo arrancar

Ver [`INSTALL.md`](./INSTALL.md). Resumen:

```
/plugin marketplace add arielmirra/coderhub
/plugin install coderhub@coderhub
/coderhub:coderhub-setup
```

Después usá las skills en lenguaje natural: *"optimizá mi LinkedIn"*, *"armame el CV"*, etc.

---

## Estructura del plugin

```
coderhub/
├── .claude-plugin/
│   ├── plugin.json           ← manifest del plugin
│   └── marketplace.json      ← catálogo del marketplace
│
├── skills/                   ← las skills de Claude Code
│   ├── coderhub-setup/        ← onboarding (correr 1ra vez)
│   ├── linkedin-profile-optimizer/
│   ├── linkedin-feed-job-hunter/
│   ├── interview-prep/
│   └── cv-builder/
│
├── shared/                   ← reglas compartidas entre skills (modo stealth, schema del perfil)
│
└── profile-template/         ← plantilla en blanco del perfil (la copia coderhub-setup)
```

Tu perfil personal vive en **`~/.coderhub/profile.md`** (local a tu máquina, nunca se sube). No está en el plugin.

---

## Filosofía

- **Skool tiene el "qué" y el "por qué".** Acá está el "cómo automatizarlo".
- **Configuración una vez, uso infinito.** El perfil se llena la primera vez y todas las skills lo reutilizan.
- **Modo stealth por default si estás trabajando.** Tu empresa actual no tiene por qué enterarse que estás buscando. Las skills respetan eso.
- **Vos siempre confirmás antes de mandar.** Ningún email, DM o cambio de perfil sale sin tu OK explícito.

---

## Créditos

Algunas skills están inspiradas en herramientas que mentees de CoderHub construyeron para sí mismos:

- **`interview-prep`** ← inspirada en [trainme](https://github.com/BraianTroncoso/trainme) de Braian Troncoso (mentee de CoderHub). Si preferís un CLI standalone para terminal en vez de skill de Claude Code, revisá su repo.

Si construís algo en tu mentoría que pueda servir a otros clientes, decímelo y lo sumamos al plugin con tu crédito.

---

## ¿Algo no funciona?

Pegame un WhatsApp. Si encontrás un bug, una idea, o algo que sumaría — decímelo. Este plugin evoluciona con feedback de los clientes que lo usan.

— Ariel
