# Templates de aplicación

Plantillas parametrizables. Variables `{xxx}` se llenan desde `profile.md` o desde la oferta detectada.

---

## Email directo

### Asunto

**Español:**
```
Aplicación - {Título_del_Puesto} | {Nombre_completo} - {Rol_actual}
```

**Inglés:**
```
Application - {Job_Title} | {Full_Name} - {Current_Role}
```

### Cuerpo en español

```
Hola {Nombre_recruiter_si_identificable_else_"que_estés_bien"},

Vi tu publicación en LinkedIn sobre la posición de {Título_del_Puesto} y me interesa mucho.

Soy {Nombre}, {Rol_actual} con +{años}+ años de experiencia. Mi stack principal incluye {3_o_4_tecnologías_que_matchean_con_la_oferta}, que se alinean directamente con lo que están buscando.

Algunos highlights relevantes:
• {Logro_1_relevante_a_la_oferta_con_número}
• {Logro_2_relevante}
{• Logro_3_si_la_oferta_pide_algo_específico_y_lo_tiene_en_profile}

{Trabajo_modalidad} con disponibilidad inmediata{flexibilidad_horaria_si_aplica}.

Adjunto mi CV y quedo a disposición para coordinar una entrevista.

Portfolio: {portfolio_url}
LinkedIn: {linkedin_url}

Saludos,
{Nombre}
```

### Cuerpo en inglés

```
Hi {Recruiter_name_if_identifiable_else_"there"},

I came across your LinkedIn post about the {Job_Title} position and I'm very interested.

I'm {Name}, {Current_Role} with {years}+ years of experience. My core stack includes {3_or_4_matching_technologies}, which directly align with what you're looking for.

Some relevant highlights:
• {Achievement_1_relevant_with_number}
• {Achievement_2}
{• Achievement_3_if_specific_match}

I work {modality} and am immediately available{timezone_flexibility_if_applies}.

My CV is attached. I'd love to discuss how I can contribute to your team.

Portfolio: {portfolio_url}
LinkedIn: {linkedin_url}

Best regards,
{Name}
```

### Reglas para emails

1. **Personalizar bullets** con experiencia que match lo de la oferta. Si la oferta pide "AI agents", el primer bullet menciona el logro AI del cliente.
2. **Adjuntar CV** en idioma correspondiente.
3. **Máximo 200 palabras**.
4. Si la oferta menciona un proyecto específico de la empresa → mencionarlo en el saludo.
5. **Nunca enviar el mismo email genérico** dos veces — adaptar siempre.

---

## DM (mensaje directo) — reemplaza comentarios

### Español

```
Hola {Nombre}, vi tu publicación sobre la posición de {Puesto}.

Te escribo por privado: tengo +{años}+ años de experiencia como {Rol}, actualmente {Rol_actual}. Mi stack principal es {tecnologías_relevantes}.

Algunos puntos relevantes:
→ {Proyecto_o_logro_más_relevante_1_línea}
→ {Segundo_punto_si_aplica}

Portfolio: {portfolio_url}
LinkedIn: {linkedin_url}

Quedo a disposición para charlar cuando te sea cómodo.
```

### Inglés

```
Hi {Name}, I saw your post about the {Position}.

Reaching out privately: I have {years}+ years of experience as a {Role}, currently {Current_Role}. My core stack is {relevant_technologies}.

Relevant highlights:
→ {Most_relevant_project_or_achievement_1_line}
→ {Second_point_if_applicable}

Portfolio: {portfolio_url}
LinkedIn: {linkedin_url}

Happy to chat whenever works for you.
```

### Reglas para DMs

1. **Reemplaza comentarios públicos** — siempre que stealth ON, en vez de comentar mandar DM.
2. **Máximo 150 palabras** — DMs cortos tienen mejor tasa de respuesta.
3. **Si la persona NO es conexión y no se puede DM**, mandar solicitud de conexión con nota.
4. **Si el post dice "solo comentarios, no DMs"**: mandar solicitud de conexión + esperar a que acepte.

---

## Solicitud de conexión con nota

⚠️ Máximo 300 caracteres (límite de LinkedIn para notas de conexión).

### Español

```
Hola {Nombre}, vi tu publicación sobre {puesto_o_tema}. Soy {Rol} con experiencia en {tech_relevante}. Me encantaría conectar y explorar la oportunidad.
```

### Inglés

```
Hi {Name}, saw your post about {position_or_topic}. I'm a {Role} experienced in {relevant_tech}. Would love to connect and explore the opportunity.
```

### Reglas

1. **Solo personalizar lo esencial** — el espacio es chico.
2. **Mencionar el contexto** (la publicación) para que sepa por qué te conectás.
3. **Mencionar 1-2 tecnologías relevantes** — suficiente para que el otro vea match.

---

## Match técnico — cómo elegir tecnologías para mencionar

Cuando la oferta lista 5-10 tecnologías y el cliente matchea 3:

1. **Listar las 3 que matchean primero** — siempre.
2. Si hay espacio, **agregar 1 diferenciador del cliente que la oferta NO pidió** pero suma valor (ej. "AI agents con Claude" si la empresa parece moderna).
3. **No listar lo que el cliente NO sabe** — aunque la oferta lo pida — para no exagerar.

Ejemplo:
- Oferta pide: PHP, Laravel, Vue, AWS, Docker, Redis, Kubernetes
- Cliente sabe: PHP, Laravel, Vue, Python, Docker (NO sabe AWS, Redis, Kubernetes)
- Mencionar: "PHP, Laravel, Vue.js, Docker" + diferenciador: "experiencia integrando AI agents con Claude"
- NO mencionar AWS/Redis/Kubernetes (no los sabe — el otro lo va a descubrir, mejor honestidad).
