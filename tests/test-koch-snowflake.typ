#set document(date: none)

#import "/src/lib.typ": *

#set page(margin: 1cm)


#box(stroke: red+2pt, koch-snowflake(0, step-size: 40))

#box(stroke: red+2pt, koch-snowflake(1, step-size: 40))

#box(stroke: red+2pt, koch-snowflake(2, step-size: 20))

#box(stroke: red+2pt, koch-snowflake(3, step-size: 10))

#pagebreak(weak: true)


#box(stroke: red+2pt, koch-snowflake(4, step-size: 6, stroke: blue+2pt))

#pagebreak(weak: true)


#box(stroke: red+2pt, koch-snowflake(5, step-size: 2, fill: blue.lighten(50%), stroke: blue))

#pagebreak(weak: true)
