local snippets = {
    go = {
      fn    = 'func ${1:name}(${2:params}) ${3:returnType} {\n\t$0\n}',
      meth  = 'func (${1:r} ${2:Receiver}) ${3:name}(${4:params}) ${5:returnType} {\n\t$0\n}',
      ife   = 'if err != nil {\n\t${1:return err}\n}',
      fmtp  = 'fmt.Println(${1:v})',
      fmtf  = 'fmt.Printf("${1:%v}\\n", ${2:v})',
      st    = 'type ${1:Name} struct {\n\t$0\n}',
      iface = 'type ${1:Name} interface {\n\t$0\n}',
      forr  = 'for ${1:i}, ${2:v} := range ${3:collection} {\n\t$0\n}',
      main  = 'func main() {\n\t$0\n}',
      test  = 'func Test${1:Name}(t *testing.T) {\n\t$0\n}',
    },
  }

  vim.keymap.set('i', '<C-j>', function()
    local word = vim.fn.matchstr(vim.fn.getline('.'):sub(1, vim.fn.col('.') - 1), '\\k\\+$')
    local ft = vim.bo.filetype
    local ft_snips = snippets[ft]
    if ft_snips and ft_snips[word] then
      -- Delete the trigger word, then expand
      local keys = string.rep('<BS>', #word)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', false)
      vim.schedule(function()
        vim.snippet.expand(ft_snips[word])
      end)
    end
  end, { desc = 'Expand snippet' })
