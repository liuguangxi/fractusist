#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#table(
  columns: (160pt,) * 3,
  stroke: gray+2pt,
  box(penrose-1(
    v-ini: (p1-a-pentagon(none, (-40, 0), (40, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-a-pentagon(none, (-40, 0), (40, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-a-pentagon(none, (-40, 0), (40, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 1pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-1(
    v-ini: (p1-b-pentagon(none, (-40, 0), (40, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-b-pentagon(none, (-40, 0), (40, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-b-pentagon(none, (-40, 0), (40, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 1pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-1(
    v-ini: (p1-c-pentagon(none, (-40, 0), (40, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-c-pentagon(none, (-40, 0), (40, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-c-pentagon(none, (-40, 0), (40, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 1pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-1(
    v-ini: (p1-diamond(none, (-15.28, 0), (15.28, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-diamond(none, (-15.28, 0), (15.28, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-diamond(none, (-15.28, 0), (15.28, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 1pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-1(
    v-ini: (p1-boat(none, (-15.28, 0), (15.28, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-boat(none, (-15.28, 0), (15.28, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-boat(none, (-15.28, 0), (15.28, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 1pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-1(
    v-ini: (p1-star(none, (-15.28, 0), (15.28, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-star(none, (-15.28, 0), (15.28, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-1(
    v-ini: (p1-star(none, (-15.28, 0), (15.28, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 1pt, cap: "round", join: "round"),
    padding: 5
  ))
)

#pagebreak(weak: true)


#box(stroke: red+2pt,
  penrose-1(
    v-ini: (p1-a-pentagon(none, (-200, 0), (200, 0)),),
    n: 3,
    fill-a-pentagon: gradient.radial(red, red.darken(20%)),
    fill-b-pentagon: gradient.radial(orange, orange.darken(20%)),
    fill-c-pentagon: gradient.radial(yellow, yellow.darken(20%)),
    fill-diamond: gradient.radial(purple.lighten(70%), purple.lighten(50%)),
    fill-boat: gradient.radial(purple.lighten(70%), purple.lighten(50%)),
    fill-star: gradient.radial(purple.lighten(70%), purple.lighten(50%)),
    stroke-edge: stroke(paint: gradient.radial(luma(60%), luma(40%)), thickness: 2pt, cap: "round", join: "round"),
    padding: 10
  )
)

#pagebreak(weak: true)
