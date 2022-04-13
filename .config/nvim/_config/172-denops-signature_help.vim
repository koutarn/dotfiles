UsePlugin 'denops-signature_help'

let g:signature_help_config = {
\ 'border': v:true,
\ 'maxWidth': 80,
\ 'maxHeight': 30,
\ 'style': "currentLabelOnly",
\ 'onTriggerChar': v:false,
\ 'multiLabel': v:false,
\ }

call signature_help#enable()
