#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.5.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "utils.typ": *
#import "@preview/tiaoma:0.3.0"

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // footer: [Optional Footnote]
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)

#set quote(block: true)
#show quote: set align(left)
#show quote: set pad(x: 2em, y: -0.8em)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.8em)
#show footnote.entry: it => {
  block(inset: (x: 2em, y: 0.1em))[#text(size: 0.75em)[#it.note.body]]
}

#let fcite(clabel) = {
  footnote(cite(form: "full", label(clabel)))
}

#let author = block(inset: 0.1em)[
  #table(inset: 0.5em, stroke: none, columns: (auto, 4fr),  align: (left, left),
    [#alert[*Davide Domini*]], [`davide.domini@unibo.it`],
    // [Author 2], [`author2@mail.com`],
    // [Author 3], [`author3@mail.com`],
  )
  #place(right, dy:-1.5em)[
    #figure(image("images/disi.svg", width:40%))
  ]
]

#title-slide(
  title: "Crash Course on Programming in Python",
  subtitle: "Digital Transformation Management @ 2026",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

// #new-section-slide("Slide section 1")

#slide(title: "Who am I?")[

  - Bachelor and Master Degree in #alert[Computer Science and Engineering] at University of Bologna
  - Currently #alert[PhD Student] in Computer Science and Engineering at University of Bologna (almost finished)
  - #alert[Teaching tutor] for Software Engineering stuff in the DTM master course
  - If you have any question write me at: `davide.domini@unibo.it`

]


#slide(title: "Why this course?")[
  - In the first year you'll have a lot of #alert[CS courses] (programming and computer architectures, OS, cybersecurity, DB, ...)
  - This crash course #alert[is NOT a replacement] for those courses
  - This crash course have been conceived (mainly) for students with a business background
    - It is also a good refresher for those with a technological background
]

#slide(title: "Outline (tentative)")[
  - #alert[Lesson 01]: Intro to Computer Architectures, Operating Systems and Programming Languages
  - #alert[Lesson 02]: Lab 1 on Programming in Python
  - #alert[Lesson 03]: Lab 2 on Programming in Python
  - #alert[Lesson 03]: Lab 3 on Programming in Python
]

#slide(title: "When and where?")[
  - Friday 02/10, Room 2.13, Time: 11-14
  - Friday 02/10, Room 3.3, Time: 15-18
  - Wednesday 07/10, Room 3.1, Time: 16-18
  - Wednesday 14/10, Room 3.1, Time: 16-18
]

#slide(title: "Where can I find the slides?")[
  You can find #alert[all the slides and the code] on #alert[GitHub] (of course we will see what GitHub is, in the meanwhile think of it as one big shared folder).

  #figure(image("images/qr.svg", width: 30%))

]