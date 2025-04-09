#import "preamble.typ": *


// Background image
#let dragon = lsystem(
  ..lsystem-use("Dragon Curve"),
  order: 12, step-size: 7, start-angle: 5/4,
  stroke: 2pt + gradient.linear((main-color.lighten(70%), 0%), (white, 100%))
)


// Cover
#page(
  margin: 0pt,
  background: [
    #place(rect(width: 100%, height: 100%,
      fill: gradient.linear((main-color.lighten(70%), 0%), (main-color.lighten(80%), 100%))
    ))
    #place(dx: 100pt, dy: 120pt, dragon)
  ]
)[
  #place(dx: 0pt, dy: 0pt, box(
    width: 100%, height: 40pt,
    {
      set align(horizon)
      h(2em)
      text(size: 24pt, font: "Buenard", fill: rgb("#239dad"))[*typst*]
      h(0.5em)
      text(size: 18pt, font: sans-font, fill: luma(30%))[Package]
    }
  ))

  #place(dx: 96pt, dy: 200pt,
    text(size: 48pt, font: sans-font, weight: "bold")[
      #text(fill: main-color.darken(60%))[#name] \
      User's Manual
    ]
  )

  #place(dx: 100pt, dy: 330pt,
    text(size: 20pt, font: sans-font)[
      Version #text(fill: main-color.darken(60%))[*#version*] \
      #date
    ]
  )

  #place(dx: 100pt, dy: 650pt,
    text(size: 20pt, font: sans-font, weight: "bold")[#author]
  )
]
