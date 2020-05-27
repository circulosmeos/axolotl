" Detect axolotl files by inspecting content
" Maintainer: Roberto S. Galende
" Latest Revision: 24 May 2020
" (first line):
if did_filetype()           " filetype already set..
  if &filetype != "text"    "..and is not text..
    finish                  "..don't do these checks
  endif
endif
if getline(1) =~ '^[\-]\{79}$'
  setfiletype axolotl
elseif getline(1) =~ '^\[\[[^\]]\+\]\] '
  setfiletype axolotl
endif
