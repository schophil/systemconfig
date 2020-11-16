syntax match plugin "\<\h\+\(\s*{\)\@="
hi default link plugin Keyword

syntax match option "\<\h\+\(\s*=>\)\@="
hi default link option Identifier

syntax match string "\"[^\"]*\""
hi default link string String

syntax keyword toplevel input filter output if else
hi default link toplevel Special

syntax match operator "=>"
hi default link operator Operator

syntax match operator "=\~"
hi default link operator Operator

syntax match operator "=="
hi default link operator Operator

syntax match comment "#.*"
hi default link comment Comment
