local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-explorer"}

local dark_neon_colours = {
    bg = "#262733",
    fg = "#c5cdd9",
    line_bg = "#262733",
    fg_green = "#c5cdd9",
    yellow = "#deb974",
    cyan = "#5dbbc1",
    darkblue = "#081633",
    green = "#a0c980",
    orange = "#FF8800",
    purple = "#d38aea",
    magenta = "#d16d9e",
    grey = "#7e8294",
    blue = "#6cb6eb",
    red = "#ec7279"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {dark_neon_colours.blue, dark_neon_colours.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = dark_neon_colours.magenta,
        i = dark_neon_colours.green,
        v = dark_neon_colours.blue,
        [""] = dark_neon_colours.blue,
        V = dark_neon_colours.blue,
        c = dark_neon_colours.red,
        no = dark_neon_colours.magenta,
        s = dark_neon_colours.orange,
        S = dark_neon_colours.orange,
        [""] = dark_neon_colours.orange,
        ic = dark_neon_colours.yellow,
        R = dark_neon_colours.purple,
        Rv = dark_neon_colours.purple,
        cv = dark_neon_colours.red,
        ce = dark_neon_colours.red,
        r = dark_neon_colours.cyan,
        rm = dark_neon_colours.cyan,
        ["r?"] = dark_neon_colours.cyan,
        ["!"] = dark_neon_colours.red,
        t = dark_neon_colours.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "     "
    end,
    highlight = {dark_neon_colours.red, dark_neon_colours.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, dark_neon_colours.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {dark_neon_colours.purple, dark_neon_colours.bg},
    highlight = {dark_neon_colours.purple, dark_neon_colours.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {dark_neon_colours.orange, dark_neon_colours.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {dark_neon_colours.purple, dark_neon_colours.bg},
    highlight = {dark_neon_colours.orange, dark_neon_colours.line_bg, "bold"}
  }
}

section.right[3] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return " "
    end,
    highlight = {dark_neon_colours.blue, dark_neon_colours.line_bg}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[4] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    separator = "",
    icon = " ",
    highlight = {dark_neon_colours.green, dark_neon_colours.line_bg}
  }
}
section.right[5] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    separator = "",
    icon = "柳",
    highlight = {dark_neon_colours.yellow, dark_neon_colours.line_bg}
  }
}
section.right[6] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    separator = "",
    icon = " ",
    highlight = {dark_neon_colours.red, dark_neon_colours.line_bg}
  }
}

section.right[7] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {dark_neon_colours.blue, dark_neon_colours.line_bg},
    highlight = {dark_neon_colours.gray, dark_neon_colours.line_bg}
  }
}

-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {dark_neon_colours.blue, dark_neon_colours.line_bg},
--     highlight = {dark_neon_colours.fg, dark_neon_colours.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {dark_neon_colours.red, dark_neon_colours.line_bg},
    separator_highlight = {dark_neon_colours.bg, dark_neon_colours.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    separator = " ",
    icon = " ",
    highlight = {dark_neon_colours.yellow, dark_neon_colours.line_bg},
    separator_highlight = {dark_neon_colours.bg, dark_neon_colours.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {dark_neon_colours.green, dark_neon_colours.line_bg},
    separator_highlight = {dark_neon_colours.bg, dark_neon_colours.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    separator = " ",
    icon = " ",
    highlight = {dark_neon_colours.blue, dark_neon_colours.line_bg},
    separator_highlight = {dark_neon_colours.bg, dark_neon_colours.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = {"NONE", dark_neon_colours.lbg},
    highlight = {dark_neon_colours.blue, dark_neon_colours.lbg, "bold"}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function()
      local fileinfo = require("galaxyline.provider_fileinfo")
      local fname = fileinfo.get_current_file_name()
      for _, v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ""
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {dark_neon_colours.white, dark_neon_colours.lbg, "bold"}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {dark_neon_colours.fg, dark_neon_colours.lbg}
  }
}
