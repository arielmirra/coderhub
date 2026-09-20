// Banner de perfil — template CoderHub (typst).
// Reemplazá los //{{PLACEHOLDER}} y compilá:
//   typst compile banner.typ banner.png --ppi 144
// Dimensiones por destino (ver design-spec.md §1):
//   LinkedIn → W=1584pt H=396pt   |   GitHub → W=1280pt H=320pt
// El PNG sale a 2× (ppi 144): LinkedIn 3168×792, GitHub 2560×640.

#let W = 1584pt   //{{WIDTH}}  (1584 LinkedIn / 1280 GitHub)
#let H = 396pt    //{{HEIGHT}} (396 LinkedIn / 320 GitHub)

// Paleta on-brand (default técnico — no tocar salvo pedido)
#let bg      = rgb("#0A1628")
#let accent  = rgb("#0099FF")
#let accent2 = rgb("#27B2FF")
#let ink     = rgb("#E8EEF6")
#let muted   = rgb("#9FB3C8")

// Fuentes con fallback portable
#let sans = ("Helvetica Neue", "Arial", "Liberation Sans")
#let mono = ("Menlo", "DejaVu Sans Mono", "Courier New")

#set page(width: W, height: H, margin: (x: 104pt, y: 0pt), fill: bg)
#set text(fill: ink, font: sans)

// barra de acento a la izquierda (queda en la franja media, fuera de la foto)
#place(left + horizon, dx: -64pt, rect(width: 8pt, height: 210pt, fill: accent, radius: 4pt))

#align(horizon)[
  #stack(dir: ttb, spacing: 16pt,
    text(size: 19pt, weight: 700, fill: accent2, font: mono, tracking: 4pt)[SENIOR SOFTWARE ENGINEER \@ SALESFORCE], //{{EYEBROW}}
    text(size: 72pt, weight: 800)[Ariel Mirra],                                                                       //{{NAME}}
    text(size: 27pt, fill: muted)[Backend systems & developer tooling at scale — AI-native],                          //{{TAGLINE}}
    v(10pt),
    text(size: 21pt, weight: 600, fill: accent2, font: mono)[Scala · Kotlin · Java · Go · AWS · Kubernetes · Claude Code · MCP], //{{STACK}}
  )
]
