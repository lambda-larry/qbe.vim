" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal noexpandtab
setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8

setlocal cindent
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e
setlocal cinkeys=0{,0},0),0],:,!^F,o,O,e

let b:undo_indent = "setlocal cindent< indentkeys=< cinkeys< noexpandtab< tabstop< shiftwidth< softtabstop<"
