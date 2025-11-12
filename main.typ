#import "config.typ": *

#set document(title: titel)

#include "cover.typ"

#set page(
  margin: (top: 4cm),
  header: align(right)[
    #pad(
      image("images/DHBW-Logo.svg"),
      top: 1cm
    )
    #line(length: 100%)
  ],
  numbering: "1"
)
#show heading: set block(below: 1em)
#show raw: set block(fill: rgb(230, 230, 230), inset: 1em)

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
