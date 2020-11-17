syntax match plugin "\<\h\+\(\s*{\)\@="
hi default link plugin Special

syntax match option "\<\h\+\(\s*=>\)\@="
hi default link option Identifier

syntax keyword toplevel input filter output if else true false in not
hi default link toplevel Keyword

syntax match string "\"[^\"]*\""
syntax region string start="\"" end="\""
hi default link string String

syntax match operator "=>"
hi default link operator Operator

syntax match operator "=\~"
hi default link operator Operator

syntax match operator "=="
hi default link operator Operator

syntax match comment "#.*"
hi default link comment Comment
