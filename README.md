<div align=center>
  <h1><code>org-modern.nvim</code></h1>
</div>

## About

This plugin adds a modern style to Org mode buffers.

<!-- prettier-ignore-start -->
> [!TIP]
> This repository is a fork focused on adding helpful features and modernizing the plugin.
<!-- prettier-ignore-end -->

### New Features

- Sensible highlight groups.

## Modern menu

### Preview

The menu is used when selecting further actions in `agenda`, `capture` and
`export`.

![Modern menu preview](./assets/preview.png)

### Configuration

In order to use a modern menu based on floating windows, you need:

1. Load the `org-modern.menu` module.
2. Create an instance of the `menu` class via the `new` function.
3. Use the modern menu inside the `handler` function in the `orgmode`
   configuration.

Here is an example of `orgmode` configuration for using a modern menu:

```lua
local Menu = require("org-modern.menu")

require("orgmode").setup({
  ui = {
    menu = {
      handler = function(data)
        Menu:new({
          window = {
            margin = { 1, 0, 1, 0 },
            padding = { 0, 1, 0, 1 },
            title_pos = "center",
            border = "single",
            zindex = 1000,
          },
          icons = {
            separator = "➜",
          },
        }):open(data)
      end,
    },
  },
})
```

The following is a description of the menu configuration options:

- `window` (`table`) — used to configure the appearance of the menu window, the
  following options are available:
  - `margin` (`table`) — size of the margins, they are set in the order
    `{top, right, bottom, left}`.
  - `padding` (`table`) — size of the paddings, they are set in the order
    `{top, right, bottom, left}`.
  - `title_pos` (`string`) — position of the title, the valid values are `left`,
    `center`, `right`.
  - `border` (`string`) — border type, the valid values are `none`, `single`,
    `double`, `rounded`, `solid`, `shadow`.
  - `zindex` (`number`) — stacking order (floats with higher `zindex` go on top
    on floats with lower indices), must be larger than zero.
- `icons` (`table`) — used for configuring icons, the following options are
  available:

  - `separator` (`string`) — icon used between key and label.

  ### Highlights

  The following highlight groups are used. You may change them as desired,
  please see `:h vim.api.nvim_set_hl` or `:h hi`

  | Name               | Default Link      | Fallback Link |
  | ------------------ | ----------------- | ------------- |
  | OrgModernKey       | WhichKey          | Function      |
  | OrgModernSeparator | WhichKeySeparator | Comment       |
  | OrgModernDesc      | WhichKeyDesc      | Identifier    |
  | OrgModernTitle     | WhichKeyTitle     | FloatTitle    |
