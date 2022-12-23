local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main"
	},
}

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'c',
		'cpp',
		'python',
		'lua',
		'go',
		'json',
		'clojure',
		'glsl',
		'toml',
		'latex'
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	}
}

nt_cpp_tools = {
	enable = true,
	preview = {
		quit = 'q', -- optional keymapping for quit preview
		accept = '<tab>' -- optional keymapping for accept preview
	},
	header_extension = 'hpp', -- optional
	source_extension = 'cpp', -- optional
	custom_define_class_function_commands = { -- optional
		TSCppImplWrite = {
			output_handle = require 'nvim-treesitter.nt-cpp-tools.output_handlers'.get_add_to_cpp()
		}
		--[[
        <your impl function custom command name> = {
            output_handle = function (str, context) 
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
	}
}
