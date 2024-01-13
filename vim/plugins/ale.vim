" ---------------------- Ale Setup ----------------------
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'css': ['stylelint'],
  \ 'scss': ['stylelint'],
  \ 'html': ['prettier'],
  \ 'json': ['prettier']
  \ }
let g:ale_linters = {
  \'ruby': ['rubocop'],
  \ 'css': ['stylelint'],
  \ 'scss': ['stylelint'],
  \ }
let g:ale_ruby_rubocop_executable = 'bundle'  "use local bundle exec version
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters_explicit = 1

nmap <leader>d <Plug>(ale_fix)
nmap <leader>l <Plug>(ale_lint)

