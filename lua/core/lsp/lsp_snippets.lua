require('luasnip.loaders.from_vscode').lazy_load()

local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return { os.date('%Y-%m-%d') } end
local long_date = function() return { os.date('%x') } end
local year = function() return { os.date('%Y') } end
local filename = function() return { vim.fn.expand('%:.') } end

ls.add_snippets('all', {
    snip({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        func(date, {}),
    }),
})

ls.add_snippets('cpp', {
    snip({
        trig = 'apache',
        namr = 'Apache License 2.0',
        dscr = 'The Apache License 2.0 for C++ files'
    }, {
        text({ '/**', ' * Copyright ' }), func(year, {}),
        text({ '', ' *' }),
        text({ '', ' * Licensed under the Apache License, Version 2.0 (the "License");' }),
        text({ '', ' * you may not use this file except in compliance with the License.' }),
        text({ '', ' * You may obtain a copy of the License at' }),
        text({ '', ' *' }),
        text({ '', ' *     http://www.apache.org/licenses/LICENSE-2.0' }),
        text({ '', ' *' }),
        text({ '', ' * Unless required by applicable law or agreed to in writing, software' }),
        text({ '', ' * distributed under the License is distributed on an "AS IS" BASIS,' }),
        text({ '', ' * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.' }),
        text({ '', ' * See the License for the specific language governing permissions and' }),
        text({ '', ' * limitations under the License.' }),
        text({ '', ' */', '' })
    }),
    snip({
        trig = 'fndef',
        namr = 'Function definition',
        dscr = 'Basic template of a C++ function definition'
    }, {
        text({ 'auto ' }), insert(2, 'name'),
        text({ '(' }), insert(3, 'params'), text({ ')' }),
        text({ ' -> ' }), insert(4, 'return'), text({ ';', '' })
    }),
    snip({
        trig = 'brief',
        namr = 'Brief description',
        dscr = 'Doxygen style description for C++ class and functions'
    }, {
        text({ '/**', ' * @brief ' }), insert(1, 'description'),
        text({ '', ' */' })
    }),
    snip({
        trig = 'doxyfile',
        namr = 'doxygen file documentation',
        dscr = 'Generic doxygen style document header of files'
    }, {
        text({ '/**', ' * @file ' }), func(filename, {}),
        text({ '', ' * @brief ' }), insert(1, 'description'),
        text({ '', ' * @copyright Copyright ' }), func(year, {}),
        text({ '', ' *' }),
        text({ '', ' * Licensed under the Apache License, Version 2.0 (the "License");' }),
        text({ '', ' * you may not use this file except in compliance with the License.' }),
        text({ '', ' * You may obtain a copy of the License at' }),
        text({ '', ' *' }),
        text({ '', ' *     http://www.apache.org/licenses/LICENSE-2.0' }),
        text({ '', ' *' }),
        text({ '', ' * Unless required by applicable law or agreed to in writing, software' }),
        text({ '', ' * distributed under the License is distributed on an "AS IS" BASIS,' }),
        text({ '', ' * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.' }),
        text({ '', ' * See the License for the specific language governing permissions and' }),
        text({ '', ' * limitations under the License.' }),
        text({ '', ' */', '', '' }),
        text({ '#pragma once' }),
    }),
    snip({
        trig = 'concept',
        namr = 'concept definition',
        dscr = 'The definition of a C++20 concept'
    }, {
        text({ 'template<typename Type>' }),
        text({ '', 'concept ' }), insert(1, 'name'),
        text({ ' = ' }), insert(2, 'reqs'), text({ ';' })
    }),
    snip({
        trig = 'lambda',
        namr = 'lambda definition',
        dscr = '',
    }, {
        text({ '[' }), insert(1, 'capture'), text({ ']' }),
        text({ '(' }), insert(2, 'param'), text({ ')' }),
        text({ '{' }), insert(3, 'body'), text({ '}' }),
    }),
})

ls.add_snippets('markdown', {
    snip({
        trig = 'investigation',
        namr = 'bug investigation',
        dscr = '',
    }, {
        text({ '# ' }, insert(1, 'bug title'), { '' }),
        text({ '' }, { '[Link to work item](' }, insert(2, 'link'), { ')' }, { '' }),
        text({ '' }, { '## How to setup' }, { '' }),
        text({ '' }, { '## Investigation' }, { '' }),
        text({ '' }, { '## solution' }, { '' }),
    }),
})
