# Requiremets

[Ripgrep](https://github.com/BurntSushi/ripgrep)

```
brew install ripgrep
```

[Delve](https://github.com/go-delve/delve)

```
brew install delve
```

[Prettierd](https://github.com/fsouza/prettierd)

```
npm install -g @fsouza/prettierd
```

# Usefull commands

<table>
    <tr>
        <th>Command</th>
        <th>Action</th>
        <th>Mode</th>
    </tr>
    <tr>
        <td>*</td>
        <td>Select all occurnaces of current word</td>
        <td>N</td>
    </tr>
    <tr>
        <td>"+y<td>
        <td>Yank to system clipboard</td>
        <td>N, V</td>
    </tr>
</table>

# Keymaps

<table>
    <tr>
        <th>Key</th>
        <th>Action</th>
    </tr>
    <tr>
        <td colspan="2">Neo-tree</td>
    </tr>
    <tr>
        <td>&lt;leader&gt;e</td>
        <td>Open Neo-tree</td>
    </tr>
    <tr>
        <td colspan="2">Oil.nvim</td>
    </tr>
    <tr>
        <td>&lt;leader&gt;o</td>
        <td>open Oil</td>
    </tr>
    <tr>
        <td>&lt;CR></td>
        <td>open dir/file</td>
    </tr>
    <tr>
        <td>-</td>
        <td>go up a directory</td>
    </tr>
    <tr>
        <td colspan="2">Git</td>
    </tr>
    <tr>
        <td>&lt;leader&gt;gl</td>
        <td>LazyGit</td>
    </tr>
</table>

# LSP config examples

Add `.nvim.lua` file to specify per-project configs.

## PHP

Docker container

```lua
require("lspconfig")["intelephense"].setup({
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = {
        "docker",
        "run",
        "-i",
        "--rm",
        "-v",
        ".:/app",
        "-w",
        "/app",
        "php:8.4-cli",
        "php",
    },
})
```

Docker compose

```lua
require("lspconfig")["intelephense"].setup({
    before_init = function(params)
        params.processId = vim.NIL
    end,
    cmd = {
        "docker",
        "compose",
        "run",
        "--rm",
        "php-container-name",
    },
})
```

PHP CS
```lua
local null_ls = require("null-ls")
null_ls.register(null_ls.builtins.diagnostics.phpcs.with({
    command = "./vendor/bin/phpcs --standard=phpcs.xml.dist",
}))

null_ls.register(null_ls.builtins.formatting.phpcbf.with({
    command = "./vendor/bin/phpcbf ",
}))
```
