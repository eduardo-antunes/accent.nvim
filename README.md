# accent.nvim

A neovim colorscheme with a configurable accent color. This is a lua port of
[accent.vim](https://github.com/Alligator/accent.vim), a wonderful colorscheme,
with a couple of tweaks that make it, in my opinion, a little nicer to work
with.

Unlike the original, this version is GUI-only (at least for the moment).

## Installation

No misteries here. There is no setup function that you need to call or anything,
just install it with your favorite plugin manager. With the new builtin plugin
manager of neovim, this would be:

```lua
vim.pack.add { src = "https://github.com/eduardo-antunes/accent.nvim" }
```

## Configuration

The colorscheme is configured through global vim variables (`vim.g`) and strict
compatibility is kept with the original colorscheme's configuration. A couple
new options were also added.

```lua
-- accent_color or accent_colour changes the accent color. One of red, orange,
-- green, yellow, blue, magenta or cyan; this list can be accessed with
-- require("accent").accent_colors
vim.g.accent_color = "yellow"

-- accent_darken makes the background and some of the colors darker
vim.g.accent_darken = false

-- accent_invert_status inverts the color of the statusline foreground. For
-- readability, I would recommend setting this to true
vim.g.accent_invert_status = false

-- accent_auto_cwd_color or accent_auto_cwd_colour sets the accent color
-- automatically based on the hash of the current directory
vim.g.accent_auto_cwd_color = false

-- accent_no_bg prevents the background color from being set. This is mostly
-- useful for transparent terminal backgrounds
vim.g.accent_no_bg = false

-- accent_deuteranopia makes the diff added color be blue instead of green, to
-- prevent confusion with the red used for diff deleted. Mostly useful if you
-- have deuteranopia
vim.g.accent_deuteranopia = false

-- accent_terminal sets terminal colors (vim.g.terminal_color_*)
vim.g.accent_terminal = false

-- After setting one or more of these options, reload the colorscheme so they
-- will take effect with:
vim.cmd.colors "accent"
```

The values presented above are the default ones. For the options that support
both spellings of color, the American spelling ("color") takes precedence if
both versions are set. This behavior is compatible with the original plugin.

## Differences from accent.vim

The main difference is in how colors tend to be applied generally. The original
colorscheme uses a light gray as the default foreground color and uses a color
closer to white to highlight syntax stuff. In this version, this logic is
flipped. This comes from a perception that syntax stuff is what is in least
demand to be highlighted, because it's easily recognizable, so the more readable
color is applied to user defined things, like identifiers and such. Other
differences are, in no particular order:

* Brighter color for comments, to make them stand out more;
* Support for the terminal and deuteranopia options;
* Better cursorline support. In the original, the defaul background is still
  used for certain elements even when cursorline is enabled;
* Explicit support for treesitter (mostly to stop it from overusing the accent
  color);
* Plugin support:
  * [mini.pick](https://github.com/nvim-mini/mini.pick)
  * [vim-fugitive](https://github.com/tpope/vim-fugitive)

## Usage as a "library"

Invoking `require("accent")` returns a table with the following keys:

* `load`: function that loads the colorscheme. It's what gets called when you
  invoke `colors accent`;
* `colors`: table with the current color pallete. Uses whatever accent color
  was set when `load` was last called;
* `accent_colors`: list of available accent colors. __Their order is fixed and
  won't change between versions__.

## Neat things

Here's some fun ideas of how to use this theme. An example that the README for
the original colorscheme brings up is setting specific accent colors for
specific directories:

```lua
if vim.fn.getcwd() == vim.fn.expand("$HOME/src/cool-project") then
  vim.g.accent_color = "cyan"
  vim.cmd.colors "accent"
end
```

Another idea is to use a key binding to circle through the accent colors on the
fly:

```lua
local i = 4 -- position of yellow. This will never change!
local colors = require("accent").accent_colors
vim.g.accent_color = colors[i]
vim.cmd.colors "accent"

vim.keymap.set("n", "<tab>", function()
  i = i + 1
  if i > #colors then i = 1 end
  vim.g.accent_color = colors[i]
  vim.cmd.colors "accent"
end)
```

## Thanks

Thank you to [Reece Selwood](https://github.com/Alligator), aka Alligator, for
the original colorscheme. All colors in this port, as well as most highlight
groups, were taken straight from the original. It is a lovely colorscheme with a
really creative idea, for which all credit goes to him.

## License

This is port is licensed under the Apache license:

```
Copyright 2025 Eduardo Antunes dos Santos Vieira

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

The original colorscheme, with each this version shares no code but nonetheless
borrows a lot from, is licensed under the MIT license:

```
MIT License

Copyright (c) 2025 alligator

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
