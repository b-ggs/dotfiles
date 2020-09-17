let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_skip_empty_sections = 1
let g:airline_section_b = ''
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  let s:outer = ['', '', 0, 9]
  let s:inner = ['', '', 0, 12]
  let s:inactive = ['', '', 0, 8]

  let s:active_map = airline#themes#generate_color_map(s:outer, s:inner, s:inner)
  let s:inactive_map = airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)

  let a:palette.normal = s:active_map
  let a:palette.insert = s:active_map
  let a:palette.visual = s:active_map
  let a:palette.inactive = s:inactive_map

  let a:palette.normal_modified = s:active_map
  let a:palette.insert_modified = s:active_map
  let a:palette.visual_modified = s:active_map
  let a:palette.inactive_modified = s:inactive_map
endfunction
