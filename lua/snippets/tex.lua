local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Basic environment snippet: \beg
  s('beg', {
    t '\\begin{',
    i(1, 'env'),
    t { '}', '' },
    i(2, 'content'),
    t { '', '\\end{' },
    i(1),
    t '}',
  }),

  -- Equation environment
  s('eq', {
    t { '\\begin{equation}', '  ' },
    i(1, 'E=mc^2'),
    t { '', '\\end{equation}' },
  }),

  s('s', {
    t '\\section{',
    i(1, 'Section title'),
    t '}',
  }),

  -- i for item
  s('i', {
    t '\\item ',
    i(1, 'Item'),
  }),
}
