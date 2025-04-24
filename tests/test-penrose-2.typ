#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#table(
  columns: (160pt,) * 3,
  stroke: gray+2pt,
  box(penrose-2(
    v-ini: (p2-a-triangle(none, (-60, 0), (60, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-a-triangle(none, (-60, 0), (60, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-a-triangle(none, (-60, 0), (60, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-2(
    v-ini: (p2-ap-triangle(none, (60, 0), (-60, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-ap-triangle(none, (60, 0), (-60, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-ap-triangle(none, (60, 0), (-60, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-2(
    v-ini: (p2-b-triangle(none, (-37.08, 0), (37.08, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-b-triangle(none, (-37.08, 0), (37.08, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-b-triangle(none, (-37.08, 0), (37.08, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),

  box(penrose-2(
    v-ini: (p2-bp-triangle(none, (37.08, 0), (-37.08, 0)),),
    n: 0,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-bp-triangle(none, (37.08, 0), (-37.08, 0)),),
    n: 1,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  )),
  box(penrose-2(
    v-ini: (p2-bp-triangle(none, (37.08, 0), (-37.08, 0)),),
    n: 2,
    stroke-edge: stroke(paint: black, thickness: 2pt, cap: "round", join: "round"),
    padding: 5
  ))
)

#pagebreak(weak: true)


#{
  let unit-size = 240
  let v-ini = ()
  for k in range(5) {
    let thetad = 2/5 * k * calc.pi
    let t-a = p2-a-triangle(none, (0, 0), (unit-size*calc.cos(thetad), unit-size*calc.sin(thetad)))
    let t-ap = p2-ap-triangle(t-a.at(1), none, (0, 0))
    v-ini.push(t-a)
    v-ini.push(t-ap)
  }

  box(stroke: red+2pt,
    penrose-2(
      v-ini: v-ini,
      n: 4,
      padding: 10,
      fill-a: gradient.radial(blue, blue.darken(30%)),
      fill-b: gradient.radial(red, red.darken(30%)),
      stroke-edge: stroke(paint: gradient.radial(luma(70%), luma(40%)), thickness: 2pt, cap: "round", join: "round"),
      stroke-arc1: stroke(paint: gradient.radial(blue.lighten(70%), blue.lighten(40%)), thickness: 2pt, cap: "round", join: "round"),
      stroke-arc2: stroke(paint: gradient.radial(red.lighten(70%), red.lighten(40%)), thickness: 2pt, cap: "round", join: "round")
    )
  )
}

#pagebreak(weak: true)


#{
  let unit-size = 150
  let v-ini = ()
  for k in range(5) {
    let thetad = (2/5 * k - 1/10) * calc.pi
    let t-b = p2-b-triangle(none, (0, 0), (unit-size*calc.cos(thetad), unit-size*calc.sin(thetad)))
    let t-bp = p2-bp-triangle(t-b.at(1), none, (0, 0))
    v-ini.push(t-b)
    v-ini.push(t-bp)
  }

  box(stroke: red+2pt,
    penrose-2(
      v-ini: v-ini,
      n: 4,
      padding: 50,
      fill-a: gradient.radial(blue, blue.darken(30%)),
      fill-b: gradient.radial(red, red.darken(30%)),
      stroke-edge: stroke(paint: gradient.radial(luma(70%), luma(40%)), thickness: 2pt, cap: "round", join: "round"),
      stroke-arc1: stroke(paint: gradient.radial(blue.lighten(70%), blue.lighten(40%)), thickness: 2pt, cap: "round", join: "round"),
      stroke-arc2: stroke(paint: gradient.radial(red.lighten(70%), red.lighten(40%)), thickness: 2pt, cap: "round", join: "round")
    )
  )
}

#pagebreak(weak: true)
