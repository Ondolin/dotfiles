set spell
set spelllang=en_us,de_de

highlight SpellCap guisp=yellow gui=underline
highlight SpellBad guisp=red gui=underline

function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

" ------------
"  LanguageTool
" ------------

" let g:languagetool_server_jar='$HOME/Development/tools/cli-tools/languagetool/LanguageTool-5.5-stable/languagetool-server.jar'
let g:languagetool_cmd='/usr/local/bin/languagetool'

noremap <leader>lc :LanguageToolCheck <CR>
noremap <leader>ln :lne <CR>
noremap <leader>lt :LanguageToolClear <CR>
