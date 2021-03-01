" Vim syntax file
" Language: axolotl
" Maintainer: Roberto S. Galende
" Latest Revision: 27 Jan 2021

if exists("b:current_syntax")
  if &syntax != "text"    "..and is not text..
    finish                "..don't do these checks
  endif
endif

syn match axolotlSeparator1 /[\-]\{79}$/
syn match axolotlSeparator2 /[\.]\{49}$/
syn match axolotlSeparator3 /[\+]\{24}$/

syn match axolotlKeyword /\[\[[^\]]\+\]\]/

syn match axolotlInternalLinkAnchor /:<#[^>]*>/
syn match axolotlLink /<[^>]\+>/
syn match axolotlHttpLink /https\?:\/\/[^ \t]\+/


hi def link axolotlSeparator1           PreProc
hi def link axolotlSeparator2           Statement
hi def link axolotlSeparator3           Statement
hi def link axolotlKeyword              Type
hi def link axolotlInternalLinkAnchor   Function
hi def link axolotlLink                 Statement
hi def link axolotlHttpLink             Statement

let b:current_syntax = "axolotl"
