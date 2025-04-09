#import "preamble.typ": *


// PDF meta data
#set document(
  title: [#name User's Manual],
  author: (author),
  date: none
)


// Cover
#include "cover.typ"


// Configuration
#counter(page).update(1)

#set page(
  header: [
    #set align(center)
    #box(width: 1fr, inset: (x: 2pt, y: 5pt), stroke: (bottom: 0.5pt))[
      _#name User's Manual_ #h(1fr) #context counter(page).display()
    ]
  ]
)

#set par(justify: true)

#set text(font: serif-font, size: 12pt)

#show raw: set text(font: mono-font, size: 11pt)
#show raw.where(block: true): set text(font: mono-font, size: 9pt)
#show raw.where(block: true): block.with(
    width: 100%, inset: 6pt,
    fill: luma(90%), stroke: (left: luma(40%) + 3pt)
)

#show footnote: set text(fill: main-color.darken(60%))
#show ref: set text(fill: main-color.darken(60%))
#show link: set text(fill: main-color.darken(20%))

#set list(marker: text(fill: main-color.darken(60%))[#sym.triangle.filled.r])

#set heading(numbering: (..nums) => nums.pos().map(str).join("."))
#show heading: set text(font: sans-font)
#show heading: set block(above: 1.5em, below: 1em)
#show heading.where(level: 1): set text(size: 18pt, fill: main-color.darken(60%))
#show heading.where(level: 1): set block(below: 1.5em)

#show outline.entry.where(level: 1): set outline.entry(fill: none)
#show outline.entry.where(level: 1): it => {
  set block(above: 1.5em)
  set text(font: sans-font, fill: main-color.darken(60%))
  strong[#it]
}
#show outline.entry.where(level: 3): it => {
  set text(size: 11pt)
  show raw: set text(font: mono-font, size: 10pt, fill: main-color.darken(60%), weight: "bold")
  it
}

#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: it => [
  #text(font: sans-font, weight: "bold")[
    #it.supplement
    #context it.counter.display(it.numbering)
  ]
  #h(0.5em) #it.body
]


// Contents
#heading(bookmarked: true, numbering: none, outlined: false, [Contents])
#block(height: 60%)[
  #columns(2, outline(title: none))
]

#pagebreak(weak: true)


// Main matter
= Introduction

The package `fractusist`#footnote[https://typst.app/universe/package/fractusist] creates a variety of wonderful fractals and curves in Typst.
It has the following features:
- Generate fractals using L-system. The grammar, number of iterations, drawing styles, etc. could be customized.
- Over 30 preset parameters are provided for the L-system to facilitate the drawing of fractals.
- Generate fractals using iterative methods, including Fibonacci word fractal and Z-order curve.
- Generate fractals using recursive methods, including various fractal trees and Sierpiński carpet.
- Generate parametric curves, such as spirographs and Lissajous curves.

To use it, import the latest version of this package with:
```typ
#import "@preview/fractusist:0.3.1": *
```
This line will be omitted in the examples codes that follows.

Each drawing function generates a type of fractal or curve, with a variety of configurable parameters.
And the fill and stroke style arguments are equivalent to those in the `curve` function#footnote[https://typst.app/docs/reference/visualize/curve].
The returned graph is contained within the `box` element.

In the following sections, the use of the corresponding drawing functions are described in detail depending on the generation method.

#pagebreak()


= L-system Fractal

== Guide

An L-system#footnote[https://en.wikipedia.org/wiki/L-system] or Lindenmayer system is a parallel rewriting system and a type of formal grammar.
An L-system consists of an alphabet of symbols that can be used to make strings,
a collection of production rules that expand each symbol into some larger string of symbols,
an initial "axiom" string from which to begin construction,
and a mechanism for translating the generated strings into geometric structures.

When implementing drawing, use the following parameters:
- *variables* --- a set of symbols containing elements that can be replaced (e.g. `F`)
- *constants* --- a set of symbols containing elements that cannot be replaced (e.g. `+`, `-`)
- *axiom* --- a string of symbols from above variables or constants defining the initial state of the system (e.g. `F`)
- *rules* --- the way variables can be replaced with combinations of constants and other variables (e.g. `F` → `F-F++F-F`)

The rules of the L-system grammar are applied iteratively starting from the initial state.
As many rules as possible are applied simultaneously, per iteration.
The symbols in the resulting string are then parsed for drawing.

Currently the following symbols and corresponding drawing directives are supported (all other symbols are ignored):
- _Sd_ --- move forward by line length drawing a line, here _Sd_ is a set of preset symbols
- _Sm_ --- move forward by line length without drawing a line, here _Sm_ is a set of preset symbols
- `+` --- turn left by turning angle
- `-` --- turn right by turning angle
- `|` --- reverse direction (i.e. turn by 180 degrees)
- `[` --- save the current state (i.e. the position and direction)
- `]` --- restore the last saved state

Here are the internal details inside the codes:
+ Generate string iteratively according the rules of the specific L-system.
+ Dynamically update vertex coordinates and the entire shape bounding box by parsing each symbol in generated string. At the same time, generate the corresponding drawing commands.
+ Assemble the drawing commands into the final `curve` function call and return it within the `box` object.


== Reference

=== `dragon-curve`

Generate dragon curve#footnote[https://en.wikipedia.org/wiki/Dragon_curve].

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`dragon-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 16.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `hilbert-curve`

Generate 2D Hilbert curve#footnote[https://en.wikipedia.org/wiki/Hilbert_curve].

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`hilbert-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 1 to 8.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `peano-curve`

Generate 2D Peano curve (Hilbert II curve)#footnote[https://en.wikipedia.org/wiki/Peano_curve].

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`peano-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 1 to 5.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `koch-curve`

Generate Koch curve.

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`koch-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 6.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `koch-snowflake`

Generate Koch snowflake#footnote[https://en.wikipedia.org/wiki/Koch_snowflake].

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`koch-snowflake`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 6.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `sierpinski-curve`

Generate classic Sierpiński curve#footnote[https://en.wikipedia.org/wiki/Sierpi%C5%84ski_curve].

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`sierpinski-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 7.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `sierpinski-square-curve`

Generate Sierpiński square curve.

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`sierpinski-square-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 7.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `sierpinski-arrowhead-curve`

Generate Sierpiński arrowhead curve.

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`sierpinski-arrowhead-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 8.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `sierpinski-triangle`

Generate 2D Sierpiński triangle#footnote[https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle].

*Note*: This function has been superseded by `lsystem` and is only reserved for compatibility.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`sierpinski-triangle`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 6.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `lsystem-names`

Get all names in L-system generator library.

Currently L-system generator library defines the parameters for the following fractals (cover all previous individual ones):

#let names = lsystem-names.sorted()
#figure(
  caption: [Fracal names in L-system generator library]
)[
  #align(center)[
    #table(
      align: left,
      columns: (200pt,) * 2,
      fill: (_, y) => if calc.odd(y) {main-color.lighten(90%)},
      stroke: none,
      table.hline(stroke: blue.darken(60%) + 1.5pt),
      ..names.map(it => [#it]),
      table.hline(stroke: blue.darken(60%) + 1.5pt)
    )
  ]
] <table:names>

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`lsystem-names`]` -> `#t-array
]

#para-block[
*`names`* #h(1fr) #t-array #h(1em) #attr-ret

Returned array of fractal names (type `str`).
]

=== `lsystem-use`

Get parameters in L-system generator library by name (see @table:names).

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`lsystem-use`]`(`\
`  `#t-str`,`\
`) -> `#t-dictionary
]

#para-block[
*`name`* #h(1fr) #t-str #h(1em) #attr-req #h(0.5em) #attr-pos

The name in L-system generator library.
The valid name here is taken from the array returned by `lsystem-names` function.
]

#para-block[
*`parameters`* #h(1fr) #t-dictionary #h(1em) #attr-ret

Returned parameters set (type `dictionary`) for `lsystem` function.

It contains the following fields:
- `draw-forward-sym` #t-str
- `move-forward-sym` #t-str
- `axiom` #t-str
- `rule-set` #t-dictionary
- `angle` #t-int #t-float
- `cycle` #t-bool
]


=== `lsystem`

General L-system generator. The rules of the L-system grammar, graph shape parameters and fill/stroke styles could be specified completely.

Internally, the length limit of the generated string after iteration is set to 5000000, but it may be relaxed in future versions.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`lsystem`]`(`\
`  draw-forward-sym:` #t-str`,`\
`  move-forward-sym:` #t-str`,`\
`  axiom:` #t-str`,`\
`  rule-set:` #t-dictionary`,`\
`  angle:` #t-float`,`\
`  cycle:` #t-bool`,`\
`  order:` #t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  start-angle:` #t-int;#t-float`,`\
`  padding:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`draw-forward-sym`* #h(1fr) #t-str #h(1em) #attr-set

The symbol set for moving forward by line length drawing a line.

Default: #typc-code("\"F\"")
]

#para-block[
*`move-forward-sym`* #h(1fr) #t-str #h(1em) #attr-set

The symbol set for moving forward by line length without drawing a line.

Default: #typc-code("\"\"")
]

#para-block[
*`axiom`* #h(1fr) #t-str #h(1em) #attr-set

The starting string.

Default: #typc-code("\"F\"")
]

#para-block[
*`rule-set`* #h(1fr) #t-dictionary #h(1em) #attr-set

The rewrite rule (type `dictionary`).
Each key-value pair corresponds to a rule.

Default: #typc-code("(\"F\": \"F-F++F-F\")")
]

#para-block[
*`angle`* #h(1fr) #t-float #h(1em) #attr-set

The turning angle (in $pi$ radius). Valid range is $(0, 1)$.

Default: #typc-code("1/3")
]

#para-block[
*`cycle`* #h(1fr) #t-bool #h(1em) #attr-set

Whether close the curve.
`true` is close the curve.

Default: #typc-code("false")
]

#para-block[
*`order`* #h(1fr) #t-int #h(1em) #attr-set

The number of iterations. Must be non-negative.

*Note*: The maximum value is limited by the actual length of the string after iteration.

Default: #typc-code("3")
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`start-angle`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The starting angle of direction (in $pi$ radius). Valid range is $[0, 2)$.

Default: #typc-code("1")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


== Examples

=== Koch Snowflake

A Koch snowflake using the function `koch-snowflake`.

#let codes = ```
#koch-snowflake(
  4,
  step-size: 1.5,
  fill: silver,
  stroke: blue
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (koch-snowflake: koch-snowflake))
    )
  }
)


=== Dragon curve

A dragon curve using the function `dragon-curve`.

#let codes = ```
#dragon-curve(
  10,
  step-size: 4,
  stroke: stroke(
    paint: gradient.linear(..color.map.crest),
    thickness: 1.5pt,
    cap: "square"
  )
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr, 0.75fr),
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (dragon-curve: dragon-curve))
    )
  }
)


=== General L-system Fractals

A variant of the Koch curve which uses only right angles. All parameters in function are customized.

#let codes = ```
#lsystem(
  draw-forward-sym: "F",
  axiom: "F",
  rule-set: ("F": "F+F-F-F+F"),
  angle: 1/2,
  cycle: false,
  order: 4,
  step-size: 2.5,
  start-angle: 0,
  stroke: blue
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (lsystem: lsystem))
    )
  }
)

Another snowflake pattern uses custom parameters.

#let codes = ```
#lsystem(
  draw-forward-sym: "F",
  axiom: "[F]++++[F]++++[F]++++[F]++++[F]++++F",
  rule-set: ("F": "[+F--F]-F++F-"),
  angle: 1/12,
  cycle: false,
  order: 5,
  step-size: 4,
  start-angle: 0,
  stroke: stroke(
    paint: blue,
    thickness: 0.5pt,
    cap: "round",
    join: "round"
  )
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (lsystem: lsystem))
    )
  }
)

A Gosper curve#footnote[https://en.wikipedia.org/wiki/Gosper_curve] using preset L-system grammar parameters.

#let codes = ```
#lsystem(
  ..lsystem-use("Gosper Curve"),
  order: 4,
  step-size: 3,
  start-angle: 0,
  stroke: stroke(
    paint: gradient.linear(purple, blue, angle: 60deg),
    thickness: 1.5pt,
    cap: "round",
    join: "round"
  )
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (lsystem-use: lsystem-use, lsystem: lsystem))
    )
  }
)

#pagebreak(weak: true)


= Iterative Method Fractal

== Guide

The iterative method fractal is internally implemented similarly to L-system.

Based on a specific algorithm and given parameters, iteratively generate a sequence of drawing instructions.
Then parse the sequence to obtain the final Typst drawing primitive functions.

== Reference

=== `fibonacci-word-fractal`

Generate Fibonacci word fractal#footnote[https://en.wikipedia.org/wiki/Fibonacci_word_fractal].

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`fibonacci-word-fractal`]`(`\
`  `#t-int`,`\
`  skip-last:` #t-bool`,`\
`  step-size:` #t-int;#t-float`,`\
`  start-dir:` #t-int`,`\
`  padding:` #t-int;#t-float`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 3 to 24.
]

#para-block[
*`skip-last`* #h(1fr) #t-bool #h(1em) #attr-set

Whether skip the last symbol (Fibonacci word fractal becomes more symmetrical).
`false` is not skip the last symbol.

Default: #typc-code("true")
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`start-dir`* #h(1fr) #t-int #h(1em) #attr-set

Starting direction (0: right, 1: up, 2: left, 3: down).

Default: #typc-code("0")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `z-order-curve`

Generate Z-order curve#footnote[https://en.wikipedia.org/wiki/Z-order_curve].

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`z-order-curve`]`(`\
`  `#t-int`,`\
`  step-size:` #t-int;#t-float`,`\
`  start-dir:` #t-int`,`\
`  padding:` #t-int;#t-float`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 1 to 8.
]

#para-block[
*`step-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The step size (in pt). Must be positive.

Default: #typc-code("10")
]

#para-block[
*`start-dir`* #h(1fr) #t-int #h(1em) #attr-set

Starting direction (0: horizontal, 1: vertical).

Default: #typc-code("0")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


== Examples

=== Fibonacci Fractal

A 17th order Fibonacci word fractal.

#let codes = ```
#fibonacci-word-fractal(
  17,
  step-size: 1.75,
  stroke: stroke(
    paint: gradient.linear(..color.map.flare),
    thickness: 1.5pt,
    cap: "square"
  )
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr, 0.75fr),
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (fibonacci-word-fractal: fibonacci-word-fractal))
    )
  }
)

=== Z-order Curves

Two Z-order curves with different orientations (`Z`-shape and `N`-shape).

#let codes = ```
#let stroke-stype = stroke(
  paint: gradient.linear(..color.map.crest, angle: 0deg),
  thickness: 2pt,
  cap: "round", join: "round"
)

#z-order-curve(
  3,
  step-size: 12, start-dir: 0, stroke: stroke-stype
)

#z-order-curve(
  3,
  step-size: 12, start-dir: 1, stroke: stroke-stype
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr, 0.5fr),
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (z-order-curve: z-order-curve))
    )
  }
)

#pagebreak(weak: true)


= Recursive Method Fractal

== Guide

The recursive method fractal takes advantage of the self-similarity of the graph itself.

Based on a specific algorithm and given parameters, recursively generate a sequence of drawing instructions.
Then parse the sequence to obtain the final Typst drawing primitive functions.


== Reference

=== `sierpinski-carpet`

Generate Sierpiński carpet#footnote[https://en.wikipedia.org/wiki/Sierpi%C5%84ski_carpet].

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`sierpinski-carpet`]`(`\
`  `#t-int`,`\
`  size:` #t-int;#t-float`,`\
`  padding:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 0 to 5.
]

#para-block[
*`size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The width/height of the image (in pt). Must be positive.

Default: #typc-code("243")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `fractal-tree`

Generate fractal tree.
The thickness and color of the branches vary with the level.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`fractal-tree`]`(`\
`  `#t-int`,`\
`  root-color:` #t-color`,`\
`  leaf-color:` #t-color`,`\
`  trunk-len:` #t-int;#t-float`,`\
`  trunk-rad:` #t-int;#t-float`,`\
`  theta:` #t-int;#t-float`,`\
`  angle:` #t-int;#t-float`,`\
`  ratio:` #t-float`,`\
`  padding:` #t-int;#t-float`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 1 to 14.
]

#para-block[
*`root-color`* #h(1fr) #t-color #h(1em) #attr-set

The root branch color.

Default: #typc-code("rgb(\"#46230A\")")
]

#para-block[
*`leaf-color`* #h(1fr) #t-color #h(1em) #attr-set

The leaf color.

Default: #typc-code("rgb(\"#228B22\")")
]

#para-block[
*`trunk-len`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial length of the trunk (in pt). Must be positive.

Default: #typc-code("100")
]

#para-block[
*`trunk-rad`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial radius of the trunk (in pt). Must be positive.

Default: #typc-code("3.0")
]

#para-block[
*`theta`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial angle of the branch (in $pi$ radius). Valid range is $[0, 1]$.

Default: #typc-code("1/2")
]

#para-block[
*`angle`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The angle between branches in the same level (in $pi$ radius). Valid range is $[0, 1\/2]$.

Default: #typc-code("1/4")
]

#para-block[
*`ratio`* #h(1fr) #t-float #h(1em) #attr-set

The contraction factor between successive trunks. Valid range is $(0, 1)$.

Default: #typc-code("0.8")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `random-fractal-tree`

Generate random fractal tree.
The thickness and color of the branches vary with the level.
And the direction of the branches is random.

*Note*: This function uses the package `suiji`#footnote[https://typst.app/universe/package/suiji] internally.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`random-fractal-tree`]`(`\
`  `#t-int`,`\
`  seed:` #t-int`,`\
`  root-color:` #t-color`,`\
`  leaf-color:` #t-color`,`\
`  trunk-len:` #t-int;#t-float`,`\
`  trunk-rad:` #t-int;#t-float`,`\
`  theta:` #t-int;#t-float`,`\
`  angle:` #t-int;#t-float`,`\
`  ratio:` #t-float`,`\
`  padding:` #t-int;#t-float`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 1 to 14.
]

#para-block[
*`seed`* #h(1fr) #t-int #h(1em) #attr-set

The value of seed, effective value is an integer from $[0, 2^32-1]$

Default: #typc-code("42")
]

#para-block[
*`root-color`* #h(1fr) #t-color #h(1em) #attr-set

The root branch color.

Default: #typc-code("rgb(\"#46230A\")")
]

#para-block[
*`leaf-color`* #h(1fr) #t-color #h(1em) #attr-set

The leaf color.

Default: #typc-code("rgb(\"#228B22\")")
]

#para-block[
*`trunk-len`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial length of the trunk (in pt). Must be positive.

Default: #typc-code("100")
]

#para-block[
*`trunk-rad`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial radius of the trunk (in pt). Must be positive.

Default: #typc-code("3.0")
]

#para-block[
*`theta`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial angle of the branch (in $pi$ radius). Valid range is $[0, 1]$.

Default: #typc-code("1/2")
]

#para-block[
*`angle`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The angle between branches in the same level (in $pi$ radius). Valid range is $[0, 1\/2]$.

Default: #typc-code("1/4")
]

#para-block[
*`ratio`* #h(1fr) #t-float #h(1em) #attr-set

The contraction factor between successive trunks. Valid range is $(0, 1)$.

Default: #typc-code("0.8")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `pythagorean-tree`

Generate Pythagorean tree#footnote[https://mathworld.wolfram.com/PythagorasTree.html].
The color of the branches vary with the level.

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`pythagorean-tree`]`(`\
`  `#t-int`,`\
`  root-color:` #t-color`,`\
`  leaf-color:` #t-color`,`\
`  trunk-len:` #t-int;#t-float`,`\
`  theta:` #t-float`,`\
`  start-angle:` #t-int;#t-float`,`\
`  padding:` #t-int;#t-float`,`\
`  filling:` #t-bool`,`\
`) -> `#t-content
]

#para-block[
*`n`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The number of iterations. Valid range is 1 to 14.
]

#para-block[
*`root-color`* #h(1fr) #t-color #h(1em) #attr-set

The root branch color.

Default: #typc-code("rgb(\"#46230A\")")
]

#para-block[
*`leaf-color`* #h(1fr) #t-color #h(1em) #attr-set

The leaf color.

Default: #typc-code("rgb(\"#228B22\")")
]

#para-block[
*`trunk-len`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The initial length of the trunk (in pt). Must be positive.

Default: #typc-code("50")
]

#para-block[
*`theta`* #h(1fr) #t-float #h(1em) #attr-set

The initial angle of the branch (in $pi$ radius). Valid range is $(0, 1\2)$.

Default: #typc-code("1/5")
]

#para-block[
*`start-angle`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The starting angle of base square bottom edge direction (in $pi$ radius). Valid range is $[0, 2)$.

Default: #typc-code("100")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`filling`* #h(1fr) #t-bool #h(1em) #attr-set

Whether the drawing is filling. `false` is wireframe.

Default: #typc-code("true")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


== Examples

=== Sierpiński carpet

A Sierpiński carpet with different background and forground colors.

#let codes = ```
#box(fill: purple.darken(50%),
  sierpinski-carpet(
    4,
    size: 150,
    fill: yellow.lighten(50%),
    stroke: none
  )
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (sierpinski-carpet: sierpinski-carpet))
    )
  }
)

=== Fractal Trees

A fractal tree.

#let codes = ```
#fractal-tree(
  9,
  root-color: black,
  leaf-color: green.transparentize(40%),
  trunk-len: 50,
  trunk-rad: 3.0,
  angle: 1/8,
  ratio: 0.75
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (fractal-tree: fractal-tree))
    )
  }
)

Two random fractal trees, only the seeds are different.

#let codes = ```
#random-fractal-tree(
  12,
  seed: 1,
  root-color: black,
  leaf-color: orange.transparentize(40%),
  trunk-len: 50,
  trunk-rad: 2.0,
  angle: 0.18,
  ratio: 0.78
)

#random-fractal-tree(
  12,
  seed: 12,
  root-color: black,
  leaf-color: orange.transparentize(40%),
  trunk-len: 50,
  trunk-rad: 2.0,
  angle: 0.18,
  ratio: 0.78
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (random-fractal-tree: random-fractal-tree))
    )
  }
)


=== Pythagorean Tree

A 12th order Pythagorean tree.

#let codes = ```
#pythagorean-tree(
  12,
  leaf-color: rgb("#228B22C0"),
  trunk-len: 60
)
```

#grid(align: horizon, gutter: 10pt, columns: 1fr,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (pythagorean-tree: pythagorean-tree))
    )
  }
)

#pagebreak(weak: true)


= Parametric Curve

== Guide

Plot the curve according to the parametric equations.
Typically, the parametric equation is expressed in the form $x = x(t), y = y(t)$ in the direct coordinate system.


== Reference

=== `lissajous-curve`

Generate Lissajous curve#footnote[https://en.wikipedia.org/wiki/Lissajous_curve].

The original parametric equations for the graph are:
$
x(t) &= A sin (a t + delta) \
y(t) &= B sin (b t)
$

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`lissajous-curve`]`(`\
`  `#t-int`,`\
`  `#t-int`,`\
`  `#t-int;#t-float`,`\
`  x-size:` #t-int;#t-float`,`\
`  y-size:` #t-int;#t-float`,`\
`  padding:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  fill-rule:` #t-str`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`a`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The frequency of x-axis. Valid range is 1 to 100.
]

#para-block[
*`b`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The frequency of y-axis. Valid range is 1 to 100.
]

#para-block[
*`d`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The phase offset of x-axis (in $pi$ radius). Valid range is $[0, 2]$.
]

#para-block[
*`x-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The width of the image (in pt). Must be positive.

Default: #typc-code("100")
]

#para-block[
*`y-size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The height of the image (in pt). Must be positive.

Default: #typc-code("100")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`fill-rule`* #h(1fr) #t-str #h(1em) #attr-set

The drawing rule used to fill the curve. Valid value is `"non-zero"` or `"even-odd"`.

Default: #typc-code("\"non-zero\"")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `hypotrochoid`

Generate hypotrochoid#footnote[https://en.wikipedia.org/wiki/Hypotrochoid].

The original parametric equations for the graph are:
$
x(t) &= (a - b) cos t + h cos((a - b) / b t) \
y(t) &= (a - b) sin t - h sin((a - b) / b t)
$

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`hypotrochoid`]`(`\
`  `#t-int`,`\
`  `#t-int`,`\
`  `#t-int`,`\
`  size:` #t-int;#t-float`,`\
`  padding:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  fill-rule:` #t-str`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`a`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The radius of exterior circle. Valid range is 1 to 100.
]

#para-block[
*`b`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The radius of interior circle. Valid range is 1 to 100.
]

#para-block[
*`h`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The distance from the center of the interior circle. Valid range is 1 to 100.
]

#para-block[
*`size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The width/height of the image (in pt). Must be positive.

Default: #typc-code("100")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`fill-rule`* #h(1fr) #t-str #h(1em) #attr-set

The drawing rule used to fill the curve. Valid value is `"non-zero"` or `"even-odd"`.

Default: #typc-code("\"non-zero\"")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


=== `epitrochoid`

Generate epitrochoid#footnote[https://en.wikipedia.org/wiki/Epitrochoid].

The original parametric equations for the graph are:
$
x(t) &= (a + b) cos t - h cos((a + b) / b t) \
y(t) &= (a + b) sin t - h sin((a + b) / b t)
$

#heading(bookmarked: false, outlined: false, level: 4, numbering: none)[Parameters]

#fn-block[
#fn-name[`epitrochoid`]`(`\
`  `#t-int`,`\
`  `#t-int`,`\
`  `#t-int`,`\
`  size:` #t-int;#t-float`,`\
`  padding:` #t-int;#t-float`,`\
`  fill:` #t-fill`,`\
`  fill-rule:` #t-str`,`\
`  stroke:` #t-stroke`,`\
`) -> `#t-content
]

#para-block[
*`a`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The radius of exterior circle. Valid range is 1 to 100.
]

#para-block[
*`b`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The radius of interior circle. Valid range is 1 to 100.
]

#para-block[
*`h`* #h(1fr) #t-int #h(1em) #attr-req #h(0.5em) #attr-pos

The distance from the center of the interior circle. Valid range is 1 to 100.
]

#para-block[
*`size`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The width/height of the image (in pt). Must be positive.

Default: #typc-code("100")
]

#para-block[
*`padding`* #h(1fr) #t-int #attr-or #t-float #h(1em) #attr-set

The spacing around the content (in pt). Must be non-negative.

Default: #typc-code("0")
]

#para-block[
*`fill`* #h(1fr) #t-fill #h(1em) #attr-set

How to fill the curve.

Default: #typc-code("none")
]

#para-block[
*`fill-rule`* #h(1fr) #t-str #h(1em) #attr-set

The drawing rule used to fill the curve. Valid value is `"non-zero"` or `"even-odd"`.

Default: #typc-code("\"non-zero\"")
]

#para-block[
*`stroke`* #h(1fr) #t-stroke #h(1em) #attr-set

How to stroke the curve.

Default: #typc-code("black + 1pt")
]

#para-block[
*`graph`* #h(1fr) #t-content #h(1em) #attr-ret

Returned graph, contained within the `box` element.
]


== Examples

=== Lissajous Curves

Lissajous curves with various parameters.

#let codes = ```
#let lc = lissajous-curve.with(
  x-size: 40,
  y-size: 40,
  stroke: gradient.linear(blue, purple, angle: 45deg) + 2pt
)

#grid(
  columns: 6,
  gutter: 10pt,
  lc(1,1,1/2), lc(1,2,1/2), lc(1,3,1/2), lc(1,4,1/2), lc(1,5,1/2), lc(1,6,1/2),
  lc(2,1,1/2), lc(2,2,1/2), lc(2,3,1/2), lc(2,4,1/2), lc(2,5,1/2), lc(2,6,1/2),
  lc(3,1,1/2), lc(3,2,1/2), lc(3,3,1/2), lc(3,4,1/2), lc(3,5,1/2), lc(3,6,1/2),
  lc(4,1,1/2), lc(4,2,1/2), lc(4,3,1/2), lc(4,4,1/2), lc(4,5,1/2), lc(4,6,1/2),
  lc(5,1,1/2), lc(5,2,1/2), lc(5,3,1/2), lc(5,4,1/2), lc(5,5,1/2), lc(5,6,1/2),
  lc(6,1,1/2), lc(6,2,1/2), lc(6,3,1/2), lc(6,4,1/2), lc(6,5,1/2), lc(6,6,1/2)
)
```

#grid(align: horizon, gutter: 10pt, columns: 1fr,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (lissajous-curve: lissajous-curve))
    )
  }
)


=== Spirograph Curves

A hypotrochoid curve and an epitrochoid curve.

#let codes = ```
#hypotrochoid(
  9,
  16,
  5,
  size: 120,
  fill: blue.lighten(70%),
  fill-rule: "even-odd",
  stroke: blue
)

#epitrochoid(
  9,
  10,
  15,
  size: 120,
  fill: blue.lighten(70%),
  fill-rule: "even-odd",
  stroke: blue
)
```

#grid(align: horizon, gutter: 10pt, columns: (1fr,) * 2,
  raw(block: true, lang: "typ", codes.text),
  {
    set align(center)
    box(width: 100%, inset: 5pt, stroke: luma(50%),
      eval(codes.text, mode: "markup", scope: (hypotrochoid: hypotrochoid, epitrochoid: epitrochoid))
    )
  }
)

#pagebreak(weak: true)


= Roadmap

This page lists planned features for this package.

#unchk-box General infrastructure for iterative/recursive method fractals \
#unchk-box More flexible graphic configuration \
#unchk-box More attractive fractals and curves \
#unchk-box More fractal types, such as iterated function system (IFS), escape-time fractals, etc. \
#unchk-box Accelerate graph generation based on the WebAssembly plugin \

#pagebreak(weak: true)
