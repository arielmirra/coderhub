#set page(width: 1584pt, height: 396pt, margin: 0pt, fill: rgb("#EDE7D9"))
#set text(fill: rgb("#151515"), font: ("Helvetica Neue","Arial"))
#let mono = ("Menlo","DejaVu Sans Mono","Courier New")
#place(center + horizon)[
  #stack(dir: ttb, spacing: 18pt,
    box(fill: rgb("#0099FF"), inset: (x: 14pt, y: 8pt), stroke: 3pt + black,
      text(size: 17pt, weight: 800, fill: black, font: mono, tracking: 3pt)[SENIOR SOFTWARE ENGINEER \@ SALESFORCE]),
    text(size: 78pt, weight: 900)[Ariel Mirra],
    text(size: 23pt, weight: 600)[Backend systems & developer tooling at scale · AI-native],
    v(24pt),
    stack(dir: ltr, spacing: 16pt,
      ..("scala","kotlin","java","go","kubernetes","docker","anthropic").map(n =>
        box(fill: white, inset: 9pt, stroke: 2.5pt + black, image("logos/"+n+"-dark.svg", height: 30pt)))),
  )
]
#place(bottom + center, rect(width: 100%, height: 14pt, fill: rgb("#0099FF")))
