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
        #text(size: 8.5pt, weight: "bold", style: "italic", [Figure #context[#it.counter.display()]])—#text(size: 8.5pt, it.body) 
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

  body
}
