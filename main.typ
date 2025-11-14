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

#set bibliography(title: 
if language == "de" [Literaturverzeichnis]
else [Bibliography])

#counter(page).update(1)

#if abstract == true {
  include "content/abstract.typ"
}
#pagebreak()

#set heading(
  numbering: "1."
)

#if language == "de" {
  outline(title: "Inhaltsverzeichnis")
} else {
  outline(title: "Contents")
}
#pagebreak()


#include "content/content.typ"
#pagebreak()
#bibliography("bibliography.bib")
