#let font-serif = (
  // "Times New Roman",
  // "Noto Serif CJK JP",
  "Harano Aji Mincho",
  // "Noto Serif JP",
)

#let font-sans = (
  // "Arial",
  // "Noto Sans CJK JP"
  "Harano Aji Gothic"
  // "Noto Sans JP"
)

#let scr(a) = math.class(
  "normal",
  text(
    font: "BKM-cmmi10",
    stylistic-set: 01,
  )[$cal(#a)$]
)

