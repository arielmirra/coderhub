# CoderHub Tooling

Caja de herramientas técnicas para correr en tu compu. Complemento a la mentoría y a los módulos de Skool — Skool tiene la teoría y los videos, este repo tiene **el código que automatiza tu búsqueda**.

---

## ¿Qué hay acá?

Skills, prompts y scripts para que Claude trabaje por vos en distintas partes del proceso de búsqueda laboral. La idea: bajás el repo una vez, configurás tu perfil, y de ahí en adelante le tirás comandos a Claude para que haga el trabajo pesado.

---

## Casos de uso (sub-índice por lo que querés hacer)

| Quiero... | Skill / herramienta |
|---|---|
| Configurar mis datos para que las skills me conozcan | [`claude-skills/coderhub-setup/`](./claude-skills/coderhub-setup/) |
| Optimizar mi perfil de LinkedIn para aparecer en búsquedas de recruiters | [`claude-skills/linkedin-profile-optimizer/`](./claude-skills/linkedin-profile-optimizer/) |
| Aplicar automáticamente a ofertas que aparecen en mi feed | [`claude-skills/linkedin-feed-job-hunter/`](./claude-skills/linkedin-feed-job-hunter/) |
| Prepararme para una entrevista en 15m o 1h | [`claude-skills/interview-prep/`](./claude-skills/interview-prep/) |

Más skills se van sumando — este repo se actualiza periódicamente.

---

## Cómo arrancar

1. **Instalá Claude Code** y corré `./install.sh` para inicializar el repo. Ver [`INSTALL.md`](./INSTALL.md).
2. **Corré `coderhub-setup`** la primera vez. Te va a hacer preguntas o pedir tu CV/transcripción de la call para llenar tu perfil automáticamente en `my-profile/`.
3. **Usá las otras skills.** Todas leen el perfil que generaste en el paso 2.

---

## Estructura del repo

```
coderhub/
├── README.md                 ← este archivo
├── INSTALL.md                ← setup técnico (Claude Code, MCPs, etc.)
├── install.sh                ← inicializa el repo (instala skills + crea my-profile/)
│
├── claude-skills/            ← skills para Claude Code
│   ├── coderhub-setup/       ← onboarding (correr 1ra vez)
│   ├── linkedin-profile-optimizer/
│   ├── linkedin-feed-job-hunter/
│   └── _shared/              ← reglas compartidas (modo stealth, etc.)
│
├── profile-template/         ← plantilla en blanco (NO se modifica)
│   └── profile.md            ← template reutilizable
│
└── my-profile/               ← tu instancia personal (gitignoreada)
    └── profile.md            ← lo llena coderhub-setup con tus datos
```

---

## Filosofía

- **Skool tiene el "qué" y el "por qué".** Acá está el "cómo automatizarlo".
- **Configuración una vez, uso infinito.** El profile se llena la primera vez y todas las skills lo reutilizan.
- **Modo stealth por default si estás trabajando.** Tu empresa actual no tiene por qué enterarse que estás buscando. Las skills respetan eso.
- **Vos siempre confirmás antes de mandar.** Ningún email, DM o cambio de perfil sale sin tu OK explícito.

---

## Créditos

Algunas skills están inspiradas en herramientas que mentees de CoderHub construyeron para sí mismos:

- **`interview-prep`** ← inspirada en [trainme](https://github.com/BraianTroncoso/trainme) de Braian Troncoso (mentee de CoderHub). Si preferís un CLI standalone para terminal en vez de skill de Claude Code, revisá su repo.

Si construís algo en tu mentoría que pueda servir a otros clientes, decímelo y lo sumamos al repo con tu crédito.

---

## ¿Algo no funciona?

Pegame un WhatsApp. Si encontrás un bug, una idea, o algo que sumaría — decímelo. Este repo evoluciona con feedback de los clientes que lo usan.

— Ariel
