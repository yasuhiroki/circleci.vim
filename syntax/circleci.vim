" Vim syntax file
" Language:   CircleCI config YAML
" Maintainer: yasuhiroki <yasuhiroki.duck@gmail.com>
" License:    MIT Copyright (c) 2019 yasuhiroki

let s:save_cpo = &cpo
set cpo&vim

let s:cci_keywords_key = '\%(^\|\s\)\@<=\zs\%('.join(circleci#GetKeywords(), '\|').'\)\ze\%(\s*:\|$\)'
let s:cci_keywords_conditional_key = '\%(^\|\s\)\@<=\zs\%('.join(circleci#GetKeywordsConditional(), '\|').'\)\ze\%(\s*:\|$\)'
let s:cci_keywords_step_key = '\%([0-9A-Za-z_-]\)\@<!\%('.join(circleci#GetKeywordsStep(), '\|').'\)\ze\%(\s*:\|$\)'

syn region CciCnfParameter matchgroup=PreProc start="<<\ze[^:]" end=">>" containedin=yamlPlainScalar keepend
syn region CciCnfTemplate matchgroup=PreProc start="{{" end="}}" containedin=yamlPlainScalar keepend

exe 'syn match CciCnfKeywords /'.s:cci_keywords_key.'/ contained nextgroup=yamlKeyValueDelimiter containedin=yamlBlockMappingKey'
exe 'syn match CciCnfKeywordsConditional /'.s:cci_keywords_conditional_key.'/ contained nextgroup=yamlKeyValueDelimiter containedin=yamlBlockMappingKey'
exe 'syn match CciCnfKeywordsStep /'.s:cci_keywords_step_key.'/ contained nextgroup=yamlKeyValueDelimiter containedin=yamlBlockMappingKey'
exe 'syn match CciCnfKeywordsStep /'.s:cci_keywords_step_key.'/'

syn match CciCnfTypeKeyValue /type\s*:\s*\%(string\|boolean\|integer\|enum\|approval\)/
syn match CciCnfTypeValue /\%(string\|boolean\|integer\|enum\|approval\)/ contained containedin=CciCnfTypeKeyValue
syn match CciCnfTypeKey /type/ nextgroup=yamlKeyValueDelimiter contained containedin=CciCnfTypeKeyValue

syn match CciCnfKeywordsParameter /parameters/ contained containedin=CciCnfParameter
syn match CciCnfKeywordsTemplate /checksum/ contained containedin=CciCnfTemplate
syn region CciCnfKeywordsTemplateString matchgroup=yamlFlowStringDelimiter start='"' skip='\\"' end='"'
            \ contains=yamlEscape
            \ nextgroup=yamlKeyValueDelimiter
            \ contained containedin=CciCnfTemplate
syn region CciCnfKeywordsTemplateString matchgroup=yamlFlowStringDelimiter start="'" skip="''"  end="'"
            \ contains=yamlSingleEscape
            \ nextgroup=yamlKeyValueDelimiter
            \ contained containedin=CciCnfTemplate

hi link CciCnfKeywords Keyword
hi link CciCnfKeywordsConditional Conditional
hi link CciCnfKeywordsStep Define
hi link CciCnfTypeKey Keyword
hi link CciCnfTypeValue Type
hi link CciCnfKeywordsParameter Keyword
hi link CciCnfKeywordsTemplate Keyword
hi link CciCnfKeywordsTemplateString yamlString

let &cpo = s:save_cpo

