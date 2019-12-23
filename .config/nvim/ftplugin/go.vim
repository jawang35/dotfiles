let g:go_version_warning = 0

if v:progname == 'nvim' || (v:progname == 'vim' && v:version >= 800)
    call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
endif
