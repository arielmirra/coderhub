# Quality bar — el método CoderHub para un buen CV

Fuente de verdad del contenido de un CV que genera `cv-builder`. Destilado de (1) las **lecciones de CV del Skool de CoderHub** (método canónico), (2) CVs reales de alumnos que quedaron muy bien, y (3) feedback de Cami (head coach). No copiar datos — copiar el **nivel, la estructura y las reglas**.

> **Nota de formato:** el template `silver-dev-cv` (Typst → PDF) ya cumple lo básico de ATS — **una sola columna, texto seleccionable, sin tablas/íconos/gráficos/imágenes, fuente simple**. Eso está resuelto por el template; este doc es sobre el **contenido**.

---

## 1. Las reglas del juego: dos filtros

Un CV tiene que pasar **dos lectores**, y hay que ganarles a los dos:

1. **ATS (Applicant Tracking System)** — el 80%+ de las empresas medianas/grandes filtran con software antes de que un humano lo vea. Escanea **palabras clave** (de la JD), **estructura** (secciones rotuladas, orden lógico) y **relevancia** (cuántas veces / en qué contexto aparecen los términos). Si tu CV tiene la keyword pero mal ubicada, o gráficos/imágenes con texto embebido, no pasa.
2. **Recruiter humano** — le dedica **6-10 segundos** al primer escaneo. Lee de arriba-abajo, izquierda-derecha. Busca match rápido con la JD y señales de seniority/criterio.

**Regla mental central (filtro vs. examen):** el CV es el **filtro** para *entrar* a la conversación, no el examen. Nadie te toma examen oral de cada tecnología en la conductual. Entonces: poblá el CV para **aparecer en las búsquedas** (filtro), y defendé en la técnica lo que pusiste. "Prefiero tener una entrevista que no hubiera tenido y rebotar en la técnica, que no tener la entrevista del todo."

**Coherencia ATS + humano:** si el ATS encuentra la keyword pero el humano no encuentra evidencia detrás (la tech está en el header pero en ningún bullet), perdés credibilidad. Hay que pasar los dos.

---

## 2. Estructura canónica (orden)

1. **Header** — Nombre · `LinkedIn | GitHub | email | teléfono` (links reales). Sin foto, sin dirección física (salvo permisos de trabajo, y en una línea).
2. **Perfil / Summary profesional** — párrafo denso de 3-4 líneas.
3. **(Recent) Work Experience** — roles con bullets método Harvard.
4. **Education**.
5. **Certifications** — si aplica (ver §7).
6. **Technical Skills / Hard Skills** — agrupadas por sub-categoría (§4).
7. **Relevant Projects** — si aplica (§7).
8. **Languages** (idiomas) — última sección.

Largo objetivo: **1 página** (máximo 2 si tenés 5+ años). Bullets cortos, whitespace, el **primer tercio concentra lo más relevante** para el rol.

**Organización estratégica (no cronológica estricta):** priorizá según el rol objetivo — técnico → proyectos/herramientas/logros medibles; liderazgo → gestión de equipos y decisiones; cambio de carrera → habilidades transferibles.

**"Recent Work Experience":** si tenés 5+ años pero solo listás los últimos 2-3 roles, renombrá la sección a **"Recent Work Experience"** (o "Selected") — comunica que elegís qué mostrar, y elimina la disonancia entre los años del headline y las fechas visibles. (No uses "Featured/Highlighted Work Experience" — suena raro en inglés.)

---

## 3. Perfil / Summary — la fórmula

Párrafo de 3-4 líneas: `[Seniority + rol] + [X+ años] + [dominios/escala de impacto] + [stack core] + [diferenciador, muchas veces AI-native] + [nota de inglés]`. El título del summary vende el **rol objetivo específico**, no "todo lo que sé".

Ejemplos del nivel:
- *"Senior Software Engineer with 8+ years building high-performance, scalable backend systems... AI-native developer who actively uses LLM tools (Claude, Cursor, GitHub Copilot)... Proven track record leading complex migrations... Fluent in English."*
- *"Senior Full Stack Engineer with over 5 years engineering high-demand products in healthcare, banking, and insurance. GitHub Copilot (GH-300) certified professional..."*

---

## 4. Technical Skills — agrupadas por sub-categoría (no en bloque)

NUNCA una sola línea de comas. Agrupá con sub-encabezado por categoría (`#oneline-title-item`), adaptando las categorías al rol:
- **Languages:** Python, SQL, JavaScript, Java…
- **Frameworks & Libraries:** React, Node.js, Spring Boot…
- **Cloud & DevOps:** AWS, Docker, Kubernetes, CI/CD…
- **Data & Analytics / Databases / Tools**, etc.

Por qué: el ATS filtra por categoría (distingue "lenguaje" de "framework"); el humano lo lee de un vistazo; y demostrás criterio (saber la diferencia = señal de seniority).

**Regla de la sección `Languages` (sobre-poblarla):** para recruiters no-técnicos, los **lenguajes** son lo único que saben filtrar (no conocen Unreal/Vulkan/CUDA/Airflow). Poblá `Languages` **mucho más** que cualquier otra categoría: incluí todo lo que tocaste con cierta seriedad (materia, proyecto chico, trabajo previo) y podrías leer/entender. 8-10 lenguajes multiplican las búsquedas en las que aparecés vs. 3-4. **No inventar** lenguajes que nunca tocaste — sí listar los que "viste y entendés cómo se leen".

**Tu stack es más amplio de lo que recordás:** antes de cerrar skills, pasá por cada experiencia + proyectos/formación y reconstruí todo lo que tocaste (SAP de hace 3 años, un Tableau puntual, una migración a Snowflake). **Filtrá al final, no durante** — primer barrido: dejá entrar todo; después podás lo obsoleto/fuera del rol.

---

## 5. Bullets — método Harvard (Acción → Resultado → Relevancia)

No es un formato, es una estrategia. Cada bullet: **verbo de acción + qué hiciste + tech + resultado medible + por qué importa para el rol**.
- ❌ "Trabajé en el backend de la app."
- ✅ "Implementé una API REST en Python que redujo la latencia un 30% y mejoró la estabilidad en producción."

**Resultado logrado, NO objetivo/intención (la corrección #1 de Cami, en las 3 calls):** no redactes el bullet como intención — "Hice X **para** lograr Y" / "Develop features **for** automation and tooling" — redactalo como **resultado ya conseguido** — "Hice X **que** logró Y" / "Delivered features that automated X, reducing Y by Z%". Todo bullet cierra con "entonces qué pasó", aunque el impacto sea cualitativo.

Verbos: Lideré, Desarrollé, Implementé, Optimicé, Diseñé, Coordiné, Automaticé, Mejoré, Analicé. Primera persona sin pronombre ("Lideré…"), nunca tercera persona ni tono informal.

**Fórmula de logro:** `X% de impacto en Y tiempo → Z beneficio`.

**Siempre hay impacto** (cuando "no tenés números"): el impacto no es solo un %. Habilitaste a otro equipo, desbloqueaste una decisión, dejaste un proceso que se sostuvo, resolviste un bloqueo, sumaste capacidad técnica nueva. La pregunta operativa por bullet: *"¿qué cambió por haber hecho yo esto, que no hubiera pasado si no?"*. Esa diferencia siempre existe — encontrala y redactala.

**Estimar números con criterio:** si sabés que hubo impacto pero nadie lo midió, estimá un rango defendible ("reduje ~30% los tiempos") — válido si lo podés defender en la técnica. No inflar: 25-35% suena real; 80%+ suena a chamuyo. Elegí el valor del medio, no el más optimista.

**100% de compliance/accuracy como logro** (roles operacionales/regulados): "achieving 100% compliance with documentation and regulatory procedures" es un resultado medible, no una obviedad. Aplica donde el éxito es la ausencia de error.

---

## 6. Protagonismo, no robot (STAR completo)

El patrón a evitar: bullets que son solo "Implementé X. Desarrollé Y. Optimicé Z." — puras tareas técnicas. Eso lee como **un robot ejecutando tareas** (y hoy eso lo hace cualquier IA). Aplicá STAR completo (Situation, Task, Action, **Result**), no solo la "A".

Para que se vea la persona: mostrá **cuánta gente lideraste/con cuántos trabajaste**, la **escala** (usuarios, clientes, presupuesto, duración), tu **rol específico** ("referente técnico de X", "reporté al CTO"), y las **decisiones** que tomaste ("decidí migrar a X por estos criterios"), no solo las acciones.

**Distribución por experiencia:** 2-4 bullets técnicos puros + **al menos 1 bullet de protagonismo/liderazgo/escala** que ancle quién fuiste. Regla mental por bullet: *"¿lee como un robot describiendo una tarea, o como una persona resolviendo un problema con criterio?"*. (Vale doble en LinkedIn.)

---

## 7. Proyectos y Certificaciones

**Proyectos — link directo sobre descripción larga:** los recruiters no abren tu GitHub por iniciativa. Formato: **nombre + link directo** (1 línea) · tecnologías (media línea) · 1 oración de contexto solo si sobra espacio. Al final, "Ver más en github.com/tuusuario". En `silver-dev-cv`, usar el parámetro `date:` del `#project()` para el stack (`Tech1 · Tech2 · …`).

**Un proyecto personal sustancial puede ir como Experiencia Laboral** (no como "side project") si: es sustancial (meses/años), tiene complejidad equivalente a trabajo profesional, lo podés defender técnicamente, y tuvo uso/destinatario real. Rol: "Founder & Lead Developer" / "Solo Developer". No exagerar alcance, no inventar equipo/clientes.

**Proyectos vs. Certificaciones — no rellenar:** si no tenés proyectos relevantes, NO fuerces la sección. Reutilizá el espacio con **Certifications** debajo de Education (para data/cloud/ciberseguridad/PM pesan más: AWS, Azure/PL-300, GCP, Scrum/PMI, Tableau/PowerBI). Cada sección tiene que ganarse su lugar.

---

## 8. Coherencia (cruzada) — el error sutil más caro

- **Las tecnologías clave van en los BULLETS, no solo en el header/skills.** Si el header dice "experto en React, Node, AWS" pero ningún bullet las menciona, el humano huele que las pusiste solo para el filtro. Cuando una tech es importante en la JD, metela en 1-2 bullets con un caso real.
- **Validación cruzada skills↔experiencia:** revisá cada experiencia y asegurate de mencionar **3-5 tecnologías** en sus bullets, incluyendo varias de las que listás arriba. Ej: en vez de "Desarrollé endpoints REST", poné "Desarrollé endpoints REST en Node.js con cache en Redis, contenedorizados en Docker y desplegados en AWS Lambda, -40% en tiempos de respuesta". Sin esa validación, la sección de skills parece aspiracional.
- **Header ↔ bullets del rol:** si el summary dice "Full Stack" pero los bullets son 90% frontend, el manager desconfía. Tiene que haber coherencia.

---

## 9. Versiones por rol + adaptar a la JD

- **Una versión distinta por rol objetivo** (1-2, máximo 3): Frontend vs Full Stack = dos CVs. Cambia el **summary/título**, el **orden/énfasis de bullets**, y las **primeras skills del header**. El 80% del CV es el mismo. Nombrá los archivos con claridad: `Nombre Apellido — CV — Full Stack.pdf` (no "CV final 2").
- **Adaptar a la JD específica** (lo que casi nadie hace, 10-15 min por aplicación): leé la JD, anotá las 5-7 keywords que más se repiten, reforzalas en los bullets (de 2 → 4 apariciones), subí de visibilidad lo que la JD pide, reordená bullets, ajustá las primeras skills del header. **No** toques estructura/experiencias/formato/años/empresas. "Versión base sólida + 10 min de ajuste por aplicación."

En `cv-builder` esto se mapea directo: sin JD → versión general por rol; con JD → tailoreo (reordenar + reforzar keywords, **sin inventar**).

---

## 10. Poner de más y defender (riesgo asimétrico)

Ante "¿pongo esta tech que apenas conozco?": en general **sí**, sabiendo que la vas a defender. El riesgo es asimétrico — si la ponés y te repreguntan en la técnica, lo peor es rebotar (pero tuviste la entrevista); si no la ponés, ni aparecés en la búsqueda. Cuidado: cuanto más cerca de la **técnica**, más peso tiene defender lo que escribiste (para la conductual con RRHH, las techs son "chino básico"). Si pusiste 8 techs con base fina, estudiá un par de horas antes de la técnica. Límite honesto: "vi C# en una materia y entiendo cómo se lee" (sí) vs. "nunca vi Rust pero queda bien" (no).

---

## 11. Anti-slop (tells de IA / relleno a evitar)

El impacto lo dan los números, no los adjetivos. Los recruiters detectan "AI slop" al instante.
- **Prohibido:** `spearheaded`, `leveraged`, `cutting-edge`, `transformative`, `impactful outcomes`, `drove cross-functional collaboration`, `at scale`, `proven track record`, `deep expertise`, `measurably`, `single-handedly`, `end-to-end`, `world-class`, `results-driven`, y `robust`/`seamless`/`scalable` como adjetivos sueltos.
- **Inglés desproporcionado al perfil:** vocabulario tipo MBA de Harvard cuando el resto del perfil es neutro → inconsistencia que se nota.
- **Métricas infladas o demasiado precisas** ("optimicé 87.4% reduciendo \$2.3M") en cada bullet → se lee inventado.
- **Tecnologías que no encajan** con tu trayectoria (metidas por la JD) → entrevista que no vas a poder defender.
- **Em-dashes:** máximo 1 por bullet. No forzar rule-of-three.
- **Usar IA para reformular, no para generar desde cero:** pasar tus bullets reales y pedir reescritura en inglés profesional; reescribir en tu voz; validar cada tech y cada métrica que la IA agregue.
- Regla de una línea: si un adjetivo/adverbio no agrega un dato o número, borralo. Verbo concreto + qué + tech + resultado.

---

## 12. Errores que descartan un CV (hard don'ts)

- CV largo/denso (>1 pág sin justificar, pared de texto) → 6-10 seg no alcanzan.
- Gráficos/íconos/tablas/columnas/logos/recuadros → el ATS los rompe. **Una sola columna, texto plano.**
- Info en header/footer del documento → se pierde en la lectura automática.
- Archivo escaneado / texto como imagen → no seleccionable, ATS no lee.
- Mismatch de keywords (JD pide "SQL", vos ponés "bases de datos").
- Ortografía/gramática (Grammarly/LanguageTool + segunda lectura), formato inconsistente (una fuente, tamaños consistentes).
- Mezclar idiomas ("Experiencia laboral" con "Hard skills") → elegí uno. Internacional → inglés completo.
- Tercera persona / tono informal.
- Logros genéricos ("mejoré procesos") sin cuantificar.
- Secciones de relleno: "Información Adicional/Personal" (dirección, estado civil, DNI — para remoto no aportan), hobbies (salvo relación directa, 1 línea), cursos viejos/irrelevantes, "Referencias a pedido" (redundante).
- **"Disponibilidad inmediata" / "Available to start immediately":** SACAR — comunica desesperación y **debilita la negociación salarial** (la empresa sabe que no tenés otras opciones). Si preguntan, respondés tranquilo "en 2-3 semanas". El CV muestra valor, no urgencia.

---

## 13. Medición del CV (herramientas)

- **General:** silver.dev resume-checker (`https://open.silver.dev/resume-checker`) — apuntar a **S**.
- **Por puesto:** Resume Worded / Jobscan — apuntar a **80%+** de match con la JD.

---

## 14. Feedback de Cami (correcciones recurrentes en CV reviews reales)

Destilado de 3 CV reviews de Cami (Leandro Furyk 2026-04-27, Gastón Cipolla 2026-09-03, Juanga Ricci 2026-08-31):

- **Bullets como resultado, no como objetivo** — la corrección que repitió en las 3 (ver §5). *"No lo redactes como 'hice esto para reducir esto', sino 'hice esto que redujo esto'."*
- **Título/headline al nivel target, no al "seguro"** — poner un nivel más bajo por miedo te **auto-filtra a franjas salariales más bajas**. *"No quiero que te filtren de ninguna manera."* Usá el nombre de rol que usan las JDs de tu mercado target (investigá: ej. "Tech Lead" vs "Staff").
- **`Open to Remote` en el header = señal junior → sacarlo.** Junto con "Available to start immediately" (§12): ambos restan y debilitan la negociación.
- **No dejar gaps largos visibles en la fecha de fin del último rol** — da señal de "hace mucho sin trabajo" y resta poder de negociación. Se puede ajustar la fecha de fin al cierre real (sin mentir) para no mostrar un gap prolongado.
- **Definí UN target de rol y alineá todo** — no mezclar identidades (Full Stack/Mobile/Product) sin criterio; CV y LinkedIn 100% alineados al rol objetivo. Empezá por acá: "el punto de partida es definir a qué rol le vas a apuntar" — el perfil cambia mucho si es backend puro vs AI-oriented.
- **No uses en la experiencia un título más angosto que tu target** — ej. `Web Developer` te encajona en web; si apuntás a backend/software/AI, poné `Software Developer`. Y toda experiencia tiene que tener 2+ bullets con impacto + tecnologías aplicadas + resultado (una sola línea suelta no alcanza).
- **Aunque no haya métrica dura, el impacto TIENE que estar** (cualitativo). *"Aunque no sean métricas, tiene que estar, porque es safe, es strong esta experiencia."*
- **Proyectos: 1-2, curados por relevancia a la JD** (sección opcional/secundaria — los recruiters no le dan tanto peso salvo que sea diferencial, ej. un proyecto de IA).
- **Marco operativo (no del CV en sí, pero es el contexto):** aplicar imperfecto pero rápido — *"ya aplicar y esperar no funciona"*; no demorar la aplicación esperando el CV perfecto.

---

## Checklist antes de entregar

- [ ] ¿PROFILE denso con seniority + años + stack + diferenciador + inglés, apuntado al rol objetivo?
- [ ] ¿Casi todos los bullets con número/impacto (o impacto cualitativo real), método Harvard?
- [ ] ¿Al menos 1 bullet de protagonismo/escala por experiencia (no solo tareas técnicas)?
- [ ] ¿Skills agrupadas por sub-categoría, con `Languages` sobre-poblada?
- [ ] ¿Las techs clave aparecen en los bullets, no solo en el header? ¿3-5 techs por experiencia?
- [ ] ¿Coherencia summary ↔ bullets ↔ skills para el rol objetivo?
- [ ] ¿Proyectos con link directo? ¿O Certifications si no hay proyectos? (sin rellenar)
- [ ] ¿1-1.5 páginas, primer tercio con lo más relevante?
- [ ] ¿Sin filler / AI-slop / "disponibilidad inmediata"?
- [ ] ¿Cero invento — todo defendible en la técnica?
- [ ] Si hay JD: ¿keywords de la JD reforzadas en bullets + header?
- [ ] **¿TODAS las fechas exactas (mes + año, `MM/YYYY`)?** Experiencia Y educación. Nada de años sueltos ("2019") ni rangos vagos. `Present` solo con fecha de inicio.
- [ ] **Render Typst OK:** una sola página; títulos de `#oneline-title-item` SIN `:` final (el template lo agrega — si no, sale `Backend::`); caracteres `@ ~ $ #` escapados en el contenido.
