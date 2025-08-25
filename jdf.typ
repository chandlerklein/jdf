// JDF configuration file

#let conf(title: none, author: (), abstract: none, body) = {

  set page(
    paper: "us-letter",
    margin: (top: 1in, right: 1.5in, bottom: 1.5in, left: 1.5in),
    numbering: "1",
    footer-descent: 0.5in
  )
  set par(justify: true)
  set text(font: "Palatino", size: 11pt)

  show footnote.entry: it => {
    text(6.5pt, numbering("1 ", ..counter(footnote).at(it.note.location())))
    text(8.5pt, it.note.body)
  }

  align(center, [
    #text(size: 17pt, title)
    #par[#author.name \ #author.email ]
  ])
  block(inset: (left: 0.5in, right: 0.5in), [*_Abstract_*---#abstract])

  show link: it => text(fill: blue, it)
  show figure.caption: it => {
    block(inset: (left: 1in, right: 1in), [
      #align(left, [
        #text(size: 8.5pt, weight: "bold", style: "italic", [#it.supplement #context[#it.counter.display()]])—#text(size: 8.5pt, it.body)
      ])
    ])
  }

  set heading(numbering: "1.1.1")
  show heading: it => {
    set text(11pt)
    if it.level == 1 { block(inset: (top: 11pt, bottom: 8.5pt), upper(it)) } 
    else if it.level == 2 { block(inset: (top: 8.5pt, bottom: 8.5pt), it) } 
    else { block(inset: (top: 8.5pt, bottom: 8.5pt), text(weight: "bold", style: "italic", it)) } 
  }

  show quote: it => {
    block(inset: (left: 0.5in, right: 0.5in), it)
  }

  show table.cell: set text(8.5pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show table.cell.where(y: 0): set text(style: "normal", weight: "bold")
  set table(stroke: (_, y) => {
    if y == 1 { (top: 0.5pt )}
    if y > 1 { (top: 0.25pt) }
  })

  body
}
