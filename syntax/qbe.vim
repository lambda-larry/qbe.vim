if exists("b:current_syntax")
  finish
endif

let b:current_syntax = 'qbe'

syntax keyword QbeKeyword type
syntax keyword QbeKeyword data
syntax keyword QbeKeyword export
syntax keyword QbeKeyword function
syntax keyword QbeKeyword thread
syntax keyword QbeKeyword section
syntax keyword QbeKeyword align

syntax keyword QbeType b
syntax keyword QbeType h
syntax keyword QbeType w
syntax keyword QbeType l
syntax keyword QbeType s
syntax keyword QbeType d

syntax match QbeInteger "\<\d\+\>"
syntax match QbeInteger "\<0x\x\+\>"
syntax match QbeInteger "\<0b[0-1]\+\>"
syntax match QbeInteger "\<0o[0-7]\+\>"

syntax match QbeInteger "\<0o[0-7]\+\>"

" QBE uses fscanf to parse floating point value
" https://c9x.me/git/qbe.git/tree/parse.c?id=120f316162879b6165deba77815cd4193fb2fb59#n259
" https://en.cppreference.com/w/c/io/fscanf
" https://en.cppreference.com/w/c/string/byte/strtof.html

" floating point number, without dot
syntax match QbeFloat "[sd]_\d\+"
" floating point number, with dot, optional exponent
syntax match QbeFloat "[sd]_\d\+\.\d*\%(e[-+]\=\d\+\)\="
" floating point number, starting with a dot, optional exponent
syntax match QbeFloat "[sd]_\.\d\+\%(e[-+]\=\d\+\)\=\>"
" floating point number, without dot, with exponent
syntax match QbeFloat "[sd]_\d\+e[-+]\=\d\+[fl]\=\>"
" hexadecimal floating point number, optional leading digits, with dot, with exponent
syntax match QbeFloat "[sd]_0x\x*\.\x\+p[-+]\=\d\+\>"
" hexadecimal floating point number, with leading digits, optional dot, with exponent
syntax match QbeFloat "[sd]_0x\x\+\.\=p[-+]\=\d\+\>"

syntax case ignore
syntax match QbeFloat "[sd]_inf"
syntax match QbeFloat "[sd]_infinity"

syntax match QbeFloat "[sd]_nan"
syntax case match


syntax match QbeLabel  "@[\.0-9_a-zA-Z]\+"
syntax match QbeGlobal "\$[\.0-9_a-zA-Z]\+"
syntax match QbeTemp   "%\zs[\.0-9_a-zA-Z]\+"
syntax match QbeUser   ":[\.0-9_a-zA-Z]\+"

syntax region QbeComment start="#" end="$"

syntax match QbeSpecial display contained "\\\%(x\x\+\|\o\{1,3}\|.\|$\)"
syntax region QbeString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=QbeSpecial

syntax match QbeAssignment "=[wlsd]"

syntax keyword QbeInst add
syntax keyword QbeInst and
syntax keyword QbeInst div
syntax keyword QbeInst mul
syntax keyword QbeInst neg
syntax keyword QbeInst or
syntax keyword QbeInst rem
syntax keyword QbeInst sar
syntax keyword QbeInst shl
syntax keyword QbeInst shr
syntax keyword QbeInst sub
syntax keyword QbeInst udiv
syntax keyword QbeInst urem
syntax keyword QbeInst xor

syntax keyword QbeInstMem alloc16
syntax keyword QbeInstMem alloc4
syntax keyword QbeInstMem alloc8
syntax keyword QbeInstMem blit
syntax keyword QbeInstMem loadd
syntax keyword QbeInstMem loadl
syntax keyword QbeInstMem loads
syntax keyword QbeInstMem loadsb
syntax keyword QbeInstMem loadsh
syntax keyword QbeInstMem loadsw
syntax keyword QbeInstMem loadub
syntax keyword QbeInstMem loaduh
syntax keyword QbeInstMem loaduw
syntax keyword QbeInstMem loadw
syntax keyword QbeInstMem storeb
syntax keyword QbeInstMem stored
syntax keyword QbeInstMem storeh
syntax keyword QbeInstMem storel
syntax keyword QbeInstMem stores
syntax keyword QbeInstMem storew

syntax keyword QbeInst ceqd
syntax keyword QbeInst ceql
syntax keyword QbeInst ceqs
syntax keyword QbeInst ceqw
syntax keyword QbeInst cged
syntax keyword QbeInst cges
syntax keyword QbeInst cgtd
syntax keyword QbeInst cgts
syntax keyword QbeInst cled
syntax keyword QbeInst cles
syntax keyword QbeInst cltd
syntax keyword QbeInst clts
syntax keyword QbeInst cned
syntax keyword QbeInst cnel
syntax keyword QbeInst cnes
syntax keyword QbeInst cnew
syntax keyword QbeInst cod
syntax keyword QbeInst cos
syntax keyword QbeInst csgel
syntax keyword QbeInst csgew
syntax keyword QbeInst csgtl
syntax keyword QbeInst csgtw
syntax keyword QbeInst cslel
syntax keyword QbeInst cslew
syntax keyword QbeInst csltl
syntax keyword QbeInst csltw
syntax keyword QbeInst cugel
syntax keyword QbeInst cugew
syntax keyword QbeInst cugtl
syntax keyword QbeInst cugtw
syntax keyword QbeInst culel
syntax keyword QbeInst culew
syntax keyword QbeInst cultl
syntax keyword QbeInst cultw
syntax keyword QbeInst cuod
syntax keyword QbeInst cuos

syntax keyword QbeInst dtosi
syntax keyword QbeInst dtoui
syntax keyword QbeInst exts
syntax keyword QbeInst extsb
syntax keyword QbeInst extsh
syntax keyword QbeInst extsw
syntax keyword QbeInst extub
syntax keyword QbeInst extuh
syntax keyword QbeInst extuw
syntax keyword QbeInst sltof
syntax keyword QbeInst ultof
syntax keyword QbeInst stosi
syntax keyword QbeInst stoui
syntax keyword QbeInst swtof
syntax keyword QbeInst uwtof
syntax keyword QbeInst truncd

syntax keyword QbeInst cast
syntax keyword QbeInst copy

syntax keyword QbeInst call

syntax keyword QbeInst vastart
syntax keyword QbeInst vaarg

syntax keyword QbeInstJmp phi

syntax keyword QbeInstJmp hlt
syntax keyword QbeInstJmp jmp
syntax keyword QbeInstJmp jnz
syntax keyword QbeInstJmp ret


highlight clear QbeKeyword
highlight clear QbeType
highlight clear QbeNumber
highlight clear QbeInteger
highlight clear QbeFloat
highlight clear QbeLabel
highlight clear QbeTemp
highlight clear QbeGlobal
highlight clear QbeComment
highlight clear QbeString
highlight clear QbeSpecial
highlight clear QbeInst
highlight clear QbeInstJmp
highlight clear QbeInstMem
highlight clear QbeAssignment

if has('nvim')
  highlight default link QbeKeyword    @keyword
  highlight default link QbeType       @type.builtin
  highlight default link QbeNumber     @number
  highlight default link QbeInteger    QbeNumber
  highlight default link QbeFloat      QbeNumber
  highlight default link QbeLabel      @label
  highlight default link QbeTemp       @variable
  highlight default link QbeGlobal     @module
  highlight default link QbeUser       @type
  highlight default link QbeComment    @comment
  highlight default link QbeString     @string
  highlight default link QbeSpecial    @string.escape
  highlight default link QbeInst       @function
  highlight default link QbeInstJmp    @keyword
  highlight default link QbeInstMem    @keyword
  highlight default link QbeAssignment @operator
else
  highlight default link QbeKeyword    Keyword
  highlight default link QbeType       Type
  highlight default link QbeNumber     Number
  highlight default link QbeInteger    QbeNumber
  highlight default link QbeFloat      QbeNumber
  highlight default link QbeLabel      Label
  highlight default link QbeTemp       Normal
  highlight default link QbeGlobal     Identifier
  highlight default link QbeUser       Type
  highlight default link QbeComment    Comment
  highlight default link QbeString     String
  highlight default link QbeSpecial    Special
  highlight default link QbeInst       Function
  highlight default link QbeInstJmp    Keyword
  highlight default link QbeInstMem    Keyword
  highlight default link QbeAssignment Operator
endif
