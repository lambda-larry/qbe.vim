if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1
let b:undo_ftplugin = "setlocal comments< commentstring< formatoptions< omnifunc<"

setlocal comments=:#
setlocal commentstring=#\ %s

" setlocal format
setlocal formatoptions-=t " No Auto-wrap text using 'textwidth'

setlocal formatoptions+=c " Auto-wrap comment using 'textwidth'
setlocal formatoptions+=r " Automatically insert current comment leader after hitting <CR> in insert mode
setlocal formatoptions+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode
setlocal formatoptions+=q " Allow formatting of comments with "gq"
setlocal formatoptions+=l " Long lines are not broken in insert mode

function! QbeComplete(find_start, base)
  if a:find_start
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    let keywords = [
      \ "type",
      \ "data",
      \ "export",
      \ "function",
      \ "thread",
      \ "section",
      \ "align",
      \ "add",
      \ "and",
      \ "div",
      \ "mul",
      \ "neg",
      \ "or",
      \ "rem",
      \ "sar",
      \ "shl",
      \ "shr",
      \ "sub",
      \ "udiv",
      \ "urem",
      \ "xor",
      \ "alloc16",
      \ "alloc4",
      \ "alloc8",
      \ "blit",
      \ "loadd",
      \ "loadl",
      \ "loads",
      \ "loadsb",
      \ "loadsh",
      \ "loadsw",
      \ "loadub",
      \ "loaduh",
      \ "loaduw",
      \ "loadw",
      \ "storeb",
      \ "stored",
      \ "storeh",
      \ "storel",
      \ "stores",
      \ "storew",
      \ "ceqd",
      \ "ceql",
      \ "ceqs",
      \ "ceqw",
      \ "cged",
      \ "cges",
      \ "cgtd",
      \ "cgts",
      \ "cled",
      \ "cles",
      \ "cltd",
      \ "clts",
      \ "cned",
      \ "cnel",
      \ "cnes",
      \ "cnew",
      \ "cod",
      \ "cos",
      \ "csgel",
      \ "csgew",
      \ "csgtl",
      \ "csgtw",
      \ "cslel",
      \ "cslew",
      \ "csltl",
      \ "csltw",
      \ "cugel",
      \ "cugew",
      \ "cugtl",
      \ "cugtw",
      \ "culel",
      \ "culew",
      \ "cultl",
      \ "cultw",
      \ "cuod",
      \ "cuos",
      \ "dtosi",
      \ "dtoui",
      \ "exts",
      \ "extsb",
      \ "extsh",
      \ "extsw",
      \ "extub",
      \ "extuh",
      \ "extuw",
      \ "sltof",
      \ "ultof",
      \ "stosi",
      \ "stoui",
      \ "swtof",
      \ "uwtof",
      \ "truncd",
      \ "cast",
      \ "copy",
      \ "call",
      \ "vastart",
      \ "vaarg",
      \ "phi",
      \ "hlt",
      \ "jmp",
      \ "jnz",
      \ "ret",
      \ ]
    let res = []
    for kw in keywords
      if kw =~ '^' .. a:base
        call add(res, kw)
      endif
    endfor
    return res
  endif
endfun

setlocal omnifunc=QbeComplete
