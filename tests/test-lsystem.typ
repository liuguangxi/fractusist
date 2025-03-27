#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#let names = lsystem-names.sorted()
= L-system List
#table(
  align: left,
  columns: (1fr,) * 3,
  ..names.map(it => [#it])
)
#pagebreak(weak: true)


#let name = "Dragon Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 11, step-size: 6, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square")
  )
)
#pagebreak(weak: true)


#let name = "Hilbert Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 5, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Peano Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 7, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square")
  )
)

#let name = "Rounded Peano Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 4, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)

#let name = "Smoother Peano Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 2, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Koch Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 5, start-angle: 1, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)

#let name = "Koch Snowflake"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 4, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Sierpinski Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)

#let name = "Sierpinski Square Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 5, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Sierpinski Arrowhead Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 6, step-size: 5, start-angle: 1, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)

#let name = "Sierpinski Triangle"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 5, step-size: 10, start-angle: 1, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Sierpinski Hexagon"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 8, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Fern 1"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 6, step-size: 4, start-angle: 1/2, padding: 10,
    stroke: stroke(paint: green, thickness: 1pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Fern 2"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 6, step-size: 5, start-angle: 1/2, padding: 10,
    stroke: stroke(paint: green, thickness: 1pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Fern 3"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 5, start-angle: 1/2, padding: 10,
    stroke: stroke(paint: green, thickness: 1pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Fern 4"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 6, step-size: 5, start-angle: 1/2, padding: 10,
    stroke: stroke(paint: green, thickness: 1pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Cantor Set"
= #name
#box(stroke: gray+2pt, [
  #v(5pt)
  #for n in range(6) {
    lsystem(
      ..lsystem-use(name),
      order: n, step-size: 2*calc.pow(3, 5 - n), start-angle: 0, padding: 10,
      stroke: stroke(paint: blue, thickness: 15pt, cap: "butt")
    )
    v(5pt)
  }
])
#pagebreak(weak: true)


#let name = "Moore Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 10, start-angle: 1/2, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Gosper Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 6, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Rectangle Island Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 2, step-size: 6, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Pentaplexity"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 15, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)

#let name = "McWorter Dendrite Fractal"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Rings"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Levy Curve"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 10, step-size: 6, start-angle: 1, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Board"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 6, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Quadratic Snowflake"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 8, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Crystal"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 6, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Cesero fractal"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 6, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Penrose Tiling"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 5, step-size: 20, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Mango Leaf"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 10, step-size: 10, start-angle: 1/2, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round")
  )
)
#pagebreak(weak: true)


#let name = "Snake Kolam"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)

#let name = "Kolam"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 3, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "round", join: "round"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)


#let name = "Cross"
= #name
#box(stroke: gray+2pt,
  lsystem(
    ..lsystem-use(name),
    order: 4, step-size: 10, start-angle: 0, padding: 10,
    stroke: stroke(paint: blue, thickness: 2pt, cap: "square"),
    fill: blue.lighten(75%)
  )
)
#pagebreak(weak: true)
