#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#table(
  columns: (160pt,) * 3,
  stroke: gray+2pt,
  box(penrose-3(
    v-ini: (p3-a-triangle(none, (-25, 0), (25, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-a-triangle(none, (-25, 0), (25, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-a-triangle(none, (-25, 0), (25, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-3(
    v-ini: (p3-ap-triangle(none, (25, 0), (-25, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-ap-triangle(none, (25, 0), (-25, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-ap-triangle(none, (25, 0), (-25, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-3(
    v-ini: (p3-b-triangle(none, (-65.45, 0), (65.45, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-b-triangle(none, (-65.45, 0), (65.45, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-b-triangle(none, (-65.45, 0), (65.45, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-3(
    v-ini: (p3-bp-triangle(none, (65.45, 0), (-65.45, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-bp-triangle(none, (65.45, 0), (-65.45, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-3(
    v-ini: (p3-bp-triangle(none, (65.45, 0), (-65.45, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  ))
)

#pagebreak(weak: true)


#{
  let unit-size = 225
  let v-ini = ()
  for k in range(5) {
    let thetad = 2/5 * k * calc.pi
    let t-a = p3-a-triangle((0, 0), (unit-size*calc.cos(thetad), unit-size*calc.sin(thetad)), none)
    let t-ap = p3-ap-triangle((0, 0), t-a.at(3), none)
    v-ini.push(t-a)
    v-ini.push(t-ap)
  }

  box(stroke: red+2pt,
    penrose-3(
      v-ini: v-ini,
      n: 5,
      padding: 10,
      fill-a: gradient.radial(blue, blue.darken(20%)),
      fill-b: gradient.radial(red, red.darken(20%)),
      stroke-edge: stroke(paint: gradient.radial(luma(70%), luma(40%)), thickness: 2pt, cap: "round", join: "round"),
      stroke-arc1: stroke(paint: gradient.radial(yellow.lighten(50%), yellow.lighten(20%)), thickness: 1pt, cap: "round", join: "round"),
      stroke-arc2: stroke(paint: gradient.radial(yellow.lighten(50%), yellow.lighten(20%)), thickness: 2pt, cap: "round", join: "round")
    )
  )
}

#pagebreak(weak: true)
