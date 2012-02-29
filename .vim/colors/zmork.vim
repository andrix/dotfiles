set background=dark "or light
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "vivify"
set t_Co=256

highlight Boolean             guifg=#00ffff ctermfg=14                            gui=bold cterm=bold
highlight CTagsClass          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalConstant guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsGlobalVariable guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsImport         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight CTagsMember         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Character           guifg=#ffce43 ctermfg=221                           gui=none cterm=none
highlight Comment             guifg=#888888 ctermfg=102                           gui=none cterm=none
highlight Conditional         guifg=#90ee90 ctermfg=114                           gui=none cterm=none
highlight Constant            guifg=#cf593c ctermfg=209                           gui=none cterm=none
highlight Cursor              guifg=#000000 ctermfg=0   guibg=#00ff00 ctermbg=10  gui=none cterm=none
highlight CursorColumn        guifg=#eeeeee ctermfg=255 guibg=#0d0d0d ctermbg=232 gui=none cterm=none
highlight CursorLine          guifg=#eeeeee ctermfg=255 guibg=#0d0d0d ctermbg=232 gui=none cterm=none
highlight Debug               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Define              guifg=#bcd2ee ctermfg=153                           gui=none cterm=none
highlight DefinedName         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Delimiter           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight DiffAdd             guifg=#f8f8f8 ctermfg=15  guibg=#008b8b ctermbg=30  gui=none cterm=none
highlight DiffChange          guifg=#f8f8f8 ctermfg=15  guibg=#008b00 ctermbg=28  gui=none cterm=none
highlight DiffDelete          guifg=#f8f8f8 ctermfg=15  guibg=#000000 ctermbg=0   gui=none cterm=none
highlight DiffText            guifg=#face43 ctermfg=221                           gui=bold cterm=bold
highlight Directory           guifg=#20b2aa ctermfg=37                            gui=none cterm=none
highlight EnumerationName     guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight EnumerationValue    guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Error               guifg=#ff0000 ctermfg=196 guibg=#141414 ctermbg=233 gui=none cterm=none
highlight ErrorMsg            guifg=#ffffe0 ctermfg=230 guibg=#b22222 ctermbg=124 gui=none cterm=none
highlight Exception           guifg=#cf593c ctermfg=209                           gui=bold cterm=bold
highlight Float               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight FoldColumn          guifg=#b0d0e0 ctermfg=117 guibg=#305060 ctermbg=74  gui=bold cterm=bold
highlight Folded              guifg=#b0d0e0 ctermfg=117 guibg=#305060 ctermbg=74  gui=bold cterm=bold
highlight Function            guifg=#c7ca87 ctermfg=186                           gui=none cterm=none
highlight Identifier          guifg=#c7ca87 ctermfg=186                           gui=none cterm=none
highlight Ignore              guifg=#204050 ctermfg=74                            gui=none cterm=none
highlight IncSearch           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Include             guifg=#a2b5cd ctermfg=110                           gui=none cterm=none
highlight Keyword             guifg=#a56a30 ctermfg=137                           gui=bold cterm=bold
highlight Label               guifg=#a56a30 ctermfg=137                           gui=bold cterm=bold
highlight LineNr              guifg=#777777 ctermfg=243 guibg=#000000 ctermbg=0   gui=bold cterm=bold
highlight LocalVariable       guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Macro               guifg=#8db6cd ctermfg=74                            gui=none cterm=none
highlight MatchParen          guifg=#000000 ctermfg=0   guibg=#ffcc20 ctermbg=220 gui=bold cterm=bold
highlight ModeMsg             guifg=#90ee90 ctermfg=114 guibg=#006400 ctermbg=22  gui=none cterm=none
highlight MoreMsg             guifg=#2e8b57 ctermfg=72                            gui=bold cterm=bold
highlight NonText             guifg=#808080 ctermfg=8   guibg=#202020 ctermbg=234 gui=none cterm=none
highlight Normal              guifg=#f8f8f8 ctermfg=15  guibg=#141414 ctermbg=233 gui=none cterm=none
highlight Number              guifg=#face43 ctermfg=221                           gui=none cterm=none
highlight Operator            guifg=#dfcc77 ctermfg=221                           gui=none cterm=none
highlight PMenu               guifg=#141414 ctermfg=233 guibg=#cda869 ctermbg=179 gui=bold cterm=bold
highlight PMenuSbar           guifg=#141414 ctermfg=233 guibg=#daefa3 ctermbg=192 gui=bold cterm=bold
highlight PMenuSel            guifg=#f8f8f8 ctermfg=15  guibg=#9b703f ctermbg=137 gui=bold cterm=bold
highlight PMenuThumb          guifg=#8f9d6a ctermfg=149 guibg=#006400 ctermbg=22  gui=bold cterm=bold
highlight PreCondit           guifg=#a4d3ee ctermfg=117                           gui=none cterm=none
highlight PreProc             guifg=#8b864e ctermfg=143                           gui=none cterm=none
highlight Question            guifg=#4eee94 ctermfg=85                            gui=bold cterm=bold
highlight Repeat              guifg=#4eee94 ctermfg=85                            gui=none cterm=none
highlight Search              guifg=#eeeeee ctermfg=255 guibg=#607b8b ctermbg=67  gui=none cterm=none
highlight SignColumn          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Special             guifg=#ffa500 ctermfg=214                           gui=bold cterm=bold
highlight SpecialChar         guifg=#ffa500 ctermfg=214                           gui=none cterm=none
highlight SpecialComment      guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpecialKey          guifg=#324262 ctermfg=68  guibg=#103040 ctermbg=24  gui=none cterm=none
highlight SpellBad            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellCap            guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellLocal          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight SpellRare           guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Statement           guifg=#a56a30 ctermfg=137                           gui=bold cterm=bold
highlight StatusLine          guifg=#f8f8f8 ctermfg=15  guibg=#202020 ctermbg=234 gui=bold cterm=bold
highlight StatusLineNC        guifg=#777777 ctermfg=243 guibg=#202020 ctermbg=234 gui=none cterm=none
highlight StorageClass        guifg=#c7ca87 ctermfg=186                           gui=none cterm=none
highlight String              guifg=#d9ff77 ctermfg=191                           gui=none cterm=none
highlight Structure           guifg=#add8e6 ctermfg=81                            gui=none cterm=none
highlight TabLine             guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineFill         guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight TabLineSel          guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Tag                 guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight Title               guifg=#e066ff ctermfg=171                           gui=bold cterm=bold
highlight Todo                guifg=#ff0000 ctermfg=196 guibg=#141414 ctermbg=233 gui=bold cterm=bold
highlight Type                guifg=#c7ca87 ctermfg=186                           gui=none cterm=none
highlight Typedef             guifg=#add8e6 ctermfg=81                            gui=none cterm=none
highlight Underlined          guifg=#838b83 ctermfg=65                            gui=underline cterm=underline
highlight Union               guifg=#eeeeee ctermfg=255                           gui=none cterm=none
highlight VertSplit           guifg=#202020 ctermfg=234 guibg=#202020 ctermbg=234 gui=none cterm=none
highlight Visual              guifg=#2e8b57 ctermfg=72  guibg=#ffffff ctermbg=15  gui=none cterm=none
highlight VisualNOS           guifg=#eeeeee ctermfg=255                           gui=bold,underline cterm=bold,underline
highlight WarningMsg          guifg=#ff3030 ctermfg=203                           gui=bold cterm=bold
highlight WildMenu            guifg=#000000 ctermfg=0   guibg=#7fff00 ctermbg=118 gui=bold cterm=bold
highlight pythonBuiltin       guifg=#f8f8f8 ctermfg=15                            gui=none cterm=none
