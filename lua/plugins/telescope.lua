return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end
      }
    },
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                        ['Esc'] = actions.close
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = { ['<C-d>'] = actions.delete_buffer + actions.move_to_top }
                    }
                }
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    hidden = {
                        file_browser = true,
                        folder_browser = true
                    }
                },
                ['ui-select'] = {
                    require('telescope.themes').get_cursor {
                        results_title = true,
                        layout_config = {
                            height = 30,
                        },
                    }
                }
            }
        }
        pcall(require('telescope').load_extension, 'fzf')
        require('telescope').load_extension "file_browser"
        -- require('telescope').load_extension "ui-select"
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
}

-- local actions = require('telescope.actions')
-- require('telescope').setup {
--   defaults = {
--     mappings = {
--       i = {
--         ['<C-u>'] = false,
--         ['<C-d>'] = false,
--         ['<Esc>'] = actions.close
--       },
--     },
--   },
--   pickers = {
--     buffers = {
--       mappings = {
--         i = { ['<C-d>'] = actions.delete_buffer + actions.move_to_top }
--       }
--     }
--   },
--   extensions = {
--     file_browser = {
--       -- theme = 'ivy',
--       hijack_netrw = true,
--       hidden = {
--         file_browser = true,
--         folder_browser = true
--       }
--     },
--     ['ui-select'] = {
--       require('telescope.themes').get_cursor {
--         results_title = true,
--         layout_config = {
--           height = 30,
--         },
--       }
--     }
--   }
-- }
--
-- -- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')
-- require('telescope').load_extension "file_browser"
-- -- require('telescope').load_extension "ui-select"
