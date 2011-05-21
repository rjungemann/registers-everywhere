" persist the contents of a register to a file
function! SaveRegister(r)
  let g:current_register = a:r

ruby << EOF
  path = "#{ENV['HOME']}/.vim/registers"
  register = Vim.evaluate('g:current_register')

  `mkdir -p #{path}` if !File.exists?(path)

  File.open "#{path}/#{register}.txt", "w" do |f|
    f.puts Vim.evaluate("getreg(\"#{register}\")")
  end
EOF
endfunction

" load the contents of a register to a file
function! RestoreRegister(r)
  let g:current_register = a:r

ruby << EOF
  path = "#{ENV['HOME']}/.vim/registers"
  register = Vim.evaluate('g:current_register')

  `mkdir -p #{path}` if !File.exists?(path)

  Vim.command(":let register_file=\"#{path}/#{register}.txt\"")
  Vim.command(":let current_register=\"#{register}\"")
EOF

  let contents = join(readfile(register_file), "\n")
  call setreg(current_register, contents)
endfunction

" store a register in the clipboard
function! SaveClipboard(r)
  let g:current_register = a:r

ruby <<EOF
  register = Vim.evaluate('g:current_register')

  Vim.command(":let current_register=\"#{register}\"")
EOF
  call system("ssh localhost pbcopy", getreg(current_register))
endfunction

" pull contents of clipboard into a register
function! RestoreClipboard(r)
  let g:current_register = a:r

ruby <<EOF
  register = Vim.evaluate('g:current_register')

  Vim.command(":let current_register=\"#{register}\"")
EOF
  call setreg(current_register, system("ssh localhost pbpaste"))
endfunction

" define keymaps for each register
function! InitRegistersEverywhere()
ruby << EOF
  registers = ['-', ':', '.', '%', '#', '='] +
    ('a'..'z').to_a + ('0'..'9').to_a + ['*', '~', '_', '/', '+'] # + ['']

  registers.each do |r|
    Vim.command("map <Leader>c#{r} :call SaveRegister('#{r}')<CR>")
    Vim.command("map <Leader>v#{r} :call RestoreRegister('#{r}')<CR>")
    Vim.command("map <Leader>C#{r} :call SaveClipboard('#{r}')<CR>")
    Vim.command("map <Leader>V#{r} :call RestoreClipboard('#{r}')<CR>")
  end
EOF
endfunction

call InitRegistersEverywhere()
