# silver-dev-cv — API y template de referencia

El CV se arma con el package [`@preview/silver-dev-cv`](https://typst.app/universe/package/silver-dev-cv) de Typst Universe. Typst lo descarga solo en el primer `typst compile` (necesita internet una vez; después queda cacheado en `~/.cache/typst/`).

## Funciones del package

| Función | Firma | Para qué |
|---|---|---|
| `cv.with(...)` | `show: cv.with(font-type, continue-header, name, address, lastupdated, pagecount, date, contacts)` | Show rule que abre el documento. `contacts` es un array de `(text: "...", link: "...")` — el último puede no tener `link` (ej. teléfono). |
| `#section[Título]` | `#section[Perfil]` o `#section("Perfil")` | Encabezado de sección. |
| `#descript[...]` | `#descript[texto libre]` | Párrafo de texto (perfil, idiomas, notas). |
| `#sectionsep` | `#sectionsep` | Separador vertical entre secciones. |
| `#job(...)` | `#job(position, institution: [...], location, date, description: [ - bullet \n - bullet ])` | Un rol laboral. `description` es contenido Typst con bullets `- `. |
| `#education(...)` | `#education(institution: [...], major: [...], location)` | Una entrada educativa. |
| `#oneline-title-item(...)` | `#oneline-title-item(title: "Backend:", content: [...])` | Línea título+contenido — ideal para agrupar skills técnicas. |
| `#project(...)` | `#project(title: [...], date: [...], description: [...])` | Un proyecto. `date` se suele usar para listar tecnologías. |

## Notas de formato

- **Fechas**: string libre (`"8/2024 - 09/2025"`, `"2025 - Presente"`). El `date:` del header (`cv.with`) es la fecha de "última actualización", formato `"YYYY-M-D"`.
- **Bullets en `description`**: van dentro de `[ ]` con `- ` al inicio de cada línea. Verbo de acción + qué + tech + métrica si hay.
- **Orden de secciones típico**: Perfil → Experiencia Laboral → Educación → Habilidades Técnicas → Proyectos Relevantes → Idiomas → (Información Adicional). Con job posting, subir lo que más matchea.
- **Idioma**: todo el contenido en ES o EN según el target del alumno / idioma de la oferta. No mezclar.
- **`font-type`**: `"PT Serif"` es el default lindo. Otras opciones del package: fuentes serif/sans estándar.

## Template de ejemplo (funcional)

```typst
#import "@preview/silver-dev-cv:1.0.2": *

#show: cv.with(
  font-type: "PT Serif",
  continue-header: "false",
  name: "Matías Sánchez",
  address: "",
  lastupdated: "true",
  pagecount: "true",
  date: "2025-9-14",
  contacts: (
    (text: "LinkedIn", link: "https://www.linkedin.com/in/matias-sanchez-dev/"),
    (text: "Github", link: "https://github.com/matute155"),
    (text: "matiassanchez0762@gmail.com", link: "mailto:matiassanchez0762@gmail.com"),
    (text: "+54 9 264 483 6733")
  ),
)

#section[Perfil]
#descript[Estudiante avanzado de Ingeniería en Sistemas. Desarrollador Backend enfocado en APIs de alto rendimiento y sistemas distribuidos.]

#sectionsep
#section("Experiencia Laboral")
#job(
  position: "Golang Developer & AI Integrator",
  institution: [Freelance / Proyectos],
  location: "Remoto",
  date: "8/2024 - 09/2025",
  description: [
    - Diseño de microservicios concurrentes con Golang y Gin.
    - Arquitecturas RAG conectando GPT-4 con bases documentales privadas.
  ],
)

#sectionsep
#section("Educación")
#education(
  institution: [UTN - Facultad Regional Córdoba],
  major: [Estudiante avanzado de Ingeniería en Sistemas de Información],
  location: "Córdoba, Argentina",
)

#section("Habilidades Técnicas")
#oneline-title-item(title: "Backend:", content: [Golang (Gin), Python (FastAPI), Node.js, Microservicios, REST APIs])
#oneline-title-item(title: "Cloud & AI:", content: [Generative AI (LLMs, RAG), Google Cloud, OpenAI API, AWS])

#sectionsep
#section("Proyectos Relevantes")
#project(
   title: [Pipeline de Análisis de Documentos con IA],
   date: [Tecnologías: Golang, OpenAI API, Docker],
   description: [Procesamiento masivo de PDFs con Goroutines y GPT-4, reduciendo tiempos de análisis manual en 80%.]
)

#sectionsep
#section("Idiomas")
#descript[Español (Nativo), Inglés (Técnico - Lectura y documentación fluida)]
```

## Mapeo profile.md → secciones del CV

| Sección CV | Campo del profile |
|---|---|
| `cv.with(name, contacts)` | Identidad (nombre, email, LinkedIn, GitHub, WhatsApp, portfolio) |
| Perfil (`#descript`) | Rol actual + años exp + stack core + 1 diferenciador (resumen de 2-3 líneas) |
| Experiencia Laboral (`#job`) | Rol actual + Roles previos relevantes (cada uno un `#job`) |
| Educación (`#education`) | Educación |
| Habilidades Técnicas (`#oneline-title-item`) | Stack principal + secundario, agrupado (Backend / Frontend / Cloud & AI / DevOps / DB) |
| Proyectos Relevantes (`#project`) | Logros concretos con números (cada uno puede ser un `#project`) |
| Idiomas (`#descript`) | Idiomas |

Con job posting: reordenar Habilidades y Proyectos para que lo que matchea la oferta quede arriba. Nunca inventar — solo reordenar/enfatizar lo del perfil.
