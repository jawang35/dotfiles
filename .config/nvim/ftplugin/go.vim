if v:progname == 'nvim'
    call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
endif
