" Vim filetype plugin file
" Language:   CircleCI config YAML
" Maintainer: yasuhiroki <yasuhiroki.duck@gmail.com>
" License:    MIT Copyright (c) 2019 yasuhiroki

let s:save_cpo = &cpo
set cpo&vim

function! circleci#Complete(findstart, base)
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '[a-zA-Z0-9_]'
            let start -= 1
        endwhile
        return start
    else
        let rtn = []
        for m in sort(circleci#GetKeywordsAll())
            if m =~ '^' . a:base
                call add(rtn, m)
            endif
        endfor
        return rtn
    endif
endfunction

if exists("&ofu")
  setlocal omnifunc=circleci#Complete
endif

let &cpo = s:save_cpo
