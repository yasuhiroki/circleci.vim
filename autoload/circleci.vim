" Vim autoload file
" Language:   CircleCI config YAML
" Maintainer: yasuhiroki <yasuhiroki.duck@gmail.com>
" License:    MIT Copyright (c) 2019 yasuhiroki

let s:save_cpo = &cpo
set cpo&vim

let s:cci_keywords = [
            \ 'xcode',
            \ 'working_directory',
            \ 'workflows',
            \ 'windows',
            \ 'version',
            \ 'user',
            \ 'type',
            \ 'triggers',
            \ 'tags',
            \ 'steps',
            \ 'shell',
            \ 'schedule',
            \ 'root',
            \ 'resource_class',
            \ 'resource',
            \ 'requires',
            \ 'paths',
            \ 'path',
            \ 'parameters',
            \ 'parallelism',
            \ 'orbs',
            \ 'only',
            \ 'no_output_timeout',
            \ 'name',
            \ 'macos',
            \ 'machine',
            \ 'keys',
            \ 'key',
            \ 'jobs',
            \ 'image',
            \ 'ignore',
            \ 'fingerprints',
            \ 'filters',
            \ 'executors',
            \ 'executor',
            \ 'environment',
            \ 'entrypoint',
            \ 'docker_layer_caching',
            \ 'docker',
            \ 'destination',
            \ 'description',
            \ 'default',
            \ 'cron',
            \ 'context',
            \ 'commands',
            \ 'command',
            \ 'checksum',
            \ 'branches',
            \ 'background',
            \ 'aws_auth',
            \ 'at',
            \ ]

let s:cci_keywords_conditional = [
            \ 'when',
            \ 'unless',
            \ 'condition',
            \ ]

let s:cci_keywords_step = [
            \ 'store_test_results',
            \ 'store_artifacts',
            \ 'setup_remote_docker',
            \ 'save_cache',
            \ 'run',
            \ 'restore_cache',
            \ 'persist_to_workspace',
            \ 'deploy',
            \ 'checkout',
            \ 'attach_workspace',
            \ 'add_ssh_keys',
            \ ]

function! circleci#GetKeywords()
    return s:cci_keywords
endfunction

function! circleci#GetKeywordsConditional()
    return s:cci_keywords_conditional
endfunction

function! circleci#GetKeywordsStep()
    return s:cci_keywords_step
endfunction

function! circleci#GetKeywordsAll()
    return s:cci_keywords
                \ + s:cci_keywords_conditional
                \ + s:cci_keywords_step
endfunction

let &cpo = s:save_cpo
