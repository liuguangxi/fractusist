#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)

#set align(center + horizon)


#box(stroke: red+2pt,
  pythagorean-tree(1, trunk-len: 50)
)

#box(stroke: red+2pt,
  pythagorean-tree(2, trunk-len: 50)
)

#box(stroke: red+2pt,
  pythagorean-tree(3, trunk-len: 50, start-angle: 1/4)
)

#box(stroke: red+2pt,
  pythagorean-tree(4, trunk-len: 50, theta: 1/3, start-angle: 1/2)
)

#box(stroke: red+2pt,
  pythagorean-tree(5, trunk-len: 50, theta: 1/4, start-angle: 1)
)

#pagebreak(weak: true)


#box(stroke: red+2pt,
  pythagorean-tree(6, trunk-len: 80)
)

#box(stroke: red+2pt,
  pythagorean-tree(7, trunk-len: 80, theta: 1/3, filling: false)
)

#pagebreak(weak: true)


#box(stroke: red+2pt,
  pythagorean-tree(8, root-color: black, leaf-color: green.transparentize(40%), trunk-len: 80, padding: 10)
)

#box(stroke: red+2pt,
  pythagorean-tree(9, root-color: black, leaf-color: green.transparentize(40%), trunk-len: 80, padding: 10, filling: false)
)

#pagebreak(weak: true)
