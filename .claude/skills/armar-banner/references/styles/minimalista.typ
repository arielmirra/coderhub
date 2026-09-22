#set page(width: 1584pt, height: 396pt, margin: 0pt, fill: rgb("#0B1220"))
#set text(fill: rgb("#E8EEF6"), font: ("Helvetica Neue","Arial"))
#let mono = ("Menlo","DejaVu Sans Mono","Courier New")
#place(center + horizon)[
  #stack(dir: ttb, spacing: 20pt,
    align(center, text(size: 17pt, weight: 600, fill: rgb("#5B7A99"), font: mono, tracking: 6pt)[SENIOR SOFTWARE ENGINEER \@ SALESFORCE]),
    align(center, text(size: 70pt, weight: 300)[Ariel Mirra]),
    align(center, line(length: 120pt, stroke: 1.5pt + rgb("#0099FF"))),
    align(center, text(size: 24pt, fill: rgb("#8FA3B8"), weight: 300)[Backend systems & developer tooling at scale · AI-native]),
    v(26pt),
    align(center, stack(dir: ltr, spacing: 34pt,
      image("logos/scala.svg", height: 32pt), image("logos/kotlin.svg", height: 32pt), image("logos/java.svg", height: 32pt), image("logos/go.svg", height: 32pt), image("logos/kubernetes.svg", height: 32pt), image("logos/docker.svg", height: 32pt), image("logos/anthropic.svg", height: 32pt))),
  )
]
