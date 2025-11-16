#import "config.typ": *

#set document(title: titel)

#include "cover.typ"

#set page(
  margin: (top: 4cm),
  header: align(right)[
    #pad(
      image(logo),
      top: 1cm
    )
    #line(length: 100%)
  ],
  numbering: "1"
)
#show heading: set block(below: 1em)
#show raw: set block(fill: rgb(245, 245, 245), inset: 1em, width: 100%)

#show ref.where(form: "normal"): set ref(supplement: x => {
  if x.func() == heading and language == "de" [Kapitel] 
  else {x.supplement}
})

#show figure.where(kind: image): set figure(supplement: [Abbildung]) if language == "de"

#set bibliography(title: [Literaturverzeichnis]) if language == "de"

#counter(page).update(1)

#if show_abstract == true {
  include "content/abstract.typ"
}
#pagebreak()

#set heading(
  numbering: "1."
)

#if language == "de" {
  outline(title: "Inhaltsverzeichnis")
} else {
  outline()
}
#pagebreak()


#include "content/content.typ"
#pagebreak()

#if show_bibliography == true {
  bibliography("bibliography.bib")
}
