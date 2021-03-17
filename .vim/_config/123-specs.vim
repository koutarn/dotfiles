UsePlugin 'specs.nvim'
"=================
"edluffy/specs.nvim'
"=================
lua << EOF
require('specs').setup{
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 3,
        inc_ms = 10,
        blend = 15,
        width = 125,
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    }
}
EOF
