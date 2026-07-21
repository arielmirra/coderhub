# Modo stealth — regla compartida por todas las skills

## ¿Cuándo aplica?

Cualquier skill que toque LinkedIn, redes sociales, o emails verifica primero el campo **"Modo stealth requerido"** en `profile-template/profile.md`.

## Si stealth = ON

El cliente está empleado y su empresa actual **NO debe enterarse** de que está buscando trabajo.

### Lo que NO se hace

- ❌ Comentar en publicaciones de ofertas laborales o `#hiring`
- ❌ Dar like a publicaciones tipo "buscamos dev"
- ❌ Compartir / repostar publicaciones de ofertas
- ❌ Activar el **frame "Open to Work" verde y visible para todos**
- ❌ Cualquier acción visible en el feed que delate búsqueda activa
- ❌ Mensajes públicos en grupos donde puedan estar compañeros de la empresa actual

### Lo que SÍ se puede hacer (todo es privado / no visible para la empresa)

- ✅ Activar **"Signal interest to recruiters"** — solo visible en LinkedIn Recruiter, NO en el perfil público
- ✅ Mandar **emails directos** a contactos que aparecen en publicaciones
- ✅ Mandar **DMs / InMail** a recruiters
- ✅ Enviar **solicitudes de conexión con nota privada**
- ✅ Completar **formularios externos** linkeados desde publicaciones
- ✅ Engagement técnico (likes, comentarios) en posts **técnicos** (tutoriales, frameworks) — esto es normal de un dev y no levanta sospechas
- ✅ Compartir contenido técnico propio que **posicione** sin gritar "busco trabajo"

### Caso especial: la oferta dice "comentá y te contacto"

**Igual no comentás.** Mandás DM directo al autor explicando que por confidencialidad escribís privado. Si no podés mandar DM (no es conexión, no tiene Open Profile), mandás solicitud de conexión con nota personalizada.

## Si stealth = OFF

El cliente está desempleado, recién renunció, o su empresa ya sabe que está buscando.

- ✅ Todo lo anterior + activar **"Open to Work" público con frame verde**
- ✅ Comentar en posts de hiring
- ✅ Compartir su búsqueda públicamente
- ✅ Frame verde visible en la foto de perfil

## Verificación

Antes de cualquier acción que toque visibilidad pública, la skill **lee `profile.md`** y confirma el modo. Si no está claro o falta el campo, pregunta al cliente antes de hacer cualquier cosa.

## ¿Y si el cliente cambia de empleado a desempleado durante el programa?

Edita `profile.md` (campo "Modo stealth requerido" → no) o re-corre `/coderhub-setup`. Las skills toman el cambio en la próxima invocación.
