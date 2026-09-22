#set page(width: 1584pt, height: 396pt, margin: 0pt, fill: gradient.linear(rgb("#0A1628"), rgb("#12263f"), angle: 40deg))
#set text(fill: rgb("#E8EEF6"), font: ("Helvetica Neue","Arial"))
#let mono = ("Menlo","DejaVu Sans Mono","Courier New")
#place(top + right, dx: -80pt, dy: 40pt, circle(radius: 170pt, fill: rgb(0,153,255,45)))
#place(bottom + right, dx: -420pt, dy: 60pt, circle(radius: 130pt, fill: rgb(39,178,255,30)))
#place(center + horizon)[
  #block(width: 1230pt, inset: (x: 56pt, y: 42pt), radius: 30pt,
    fill: rgb(255,255,255,20), stroke: 1.2pt + rgb(255,255,255,55))[
    #stack(dir: ttb, spacing: 15pt,
      text(size: 18pt, weight: 700, fill: rgb("#8FD3FF"), font: mono, tracking: 5pt)[SENIOR SOFTWARE ENGINEER \@ SALESFORCE],
      text(size: 66pt, weight: 800)[Ariel Mirra],
      text(size: 25pt, fill: rgb("#C7D6E8"))[Backend systems & developer tooling at scale · AI-native],
      v(20pt),
      stack(dir: ltr, spacing: 30pt,
        image("logos/scala.svg", height: 40pt), image("logos/kotlin.svg", height: 40pt), image("logos/java.svg", height: 40pt), image("logos/go.svg", height: 40pt), image("logos/kubernetes.svg", height: 40pt), image("logos/docker.svg", height: 40pt), image("logos/anthropic.svg", height: 40pt)),
    )
  ]
]
