# Modern Neovim Configuration

This is a modern, fast, and powerful Neovim configuration designed for a seamless remote development experience. It leverages `vim-plug` for plugin management and `coc.nvim` for LSP-powered code intelligence.

## Features

*   **Modern Plugin Management:** Using `vim-plug` for easy installation and management of plugins.
*   **LSP Support:** Integrated with `coc.nvim` for intelligent code completion, linting, and navigation.
*   **Fuzzy Finding:** Using `fzf.vim` for fast file and text searching.
*   **File Explorer:** `NERDTree` for a familiar file browsing experience.
*   **Git Integration:** `vim-fugitive` for seamless Git integration.
*   **Beautiful UI:** A curated set of color schemes and a clean status line with `lightline.vim`.
*   **Great Language Support:** Out-of-the-box support for C/C++, Go, Python, Dockerfile, Bash, YAML, JSON, TOML, and Markdown.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/personal-utils.git ~/.personal-utils
    ```

2.  **Run the installation script:**

    ```bash
    cd ~/.personal-utils/vim && /bin/bash install.sh
    ```

3.  **Restart Neovim:**

    Open `nvim` and the configuration will be ready to use.

---

## Workflows

This section provides a set of common workflows to help you get the most out of this configuration.

### 1. File Operations

This configuration provides two primary ways to work with files: `NERDTree` for a visual file tree and `fzf.vim` for fast, fuzzy finding.

**Using NERDTree (File Tree):**

*   **Toggle NERDTree:** Press `<leader>n` (`space` + `n`) to open and close the NERDTree file explorer.
*   **Navigate:** Use the standard `j` and `k` keys to move up and down.
*   **Open Files:** Press `o` to open a file in a new buffer. Press `i` to open it in a horizontal split, and `s` to open it in a vertical split.
*   **File Operations:** With a file selected, press `m` to bring up a menu of file operations (e.g., rename, delete, copy).

**Using fzf (Fuzzy Finder):**

*   **Find Files:** Press `<leader>ff` to fuzzy find any file in the current directory.
*   **Find Git Files:** Press `<leader>fg` to fuzzy find only the files that are tracked by Git.
*   **Find Open Buffers:** Press `<leader>fb` to fuzzy find from the list of currently open buffers.

### 2. Code Navigation

Code navigation is powered by `coc.nvim` (LSP) and `fzf.vim`.

**Jumping to Definitions and References (LSP):**

*   **Go to Definition:** With the cursor on a symbol (e.g., a function or variable), press `gd` to jump to its definition.
*   **Find References:** Press `gr` to see all the places where the symbol is used.
*   **Go to Implementation:** Press `gi` to jump to the implementation of an interface or abstract class.
*   **Show Documentation:** Press `K` (uppercase) to see the documentation for the symbol under the cursor.

**Searching for Code (fzf):**

*   **Search for Text in Files:** Press `<leader>fr` to open `fzf` and search for any text in the current directory. This is powered by `ripgrep` and is extremely fast.

**Moving with EasyMotion:**

*   **Jump to any word:** Press `<leader>s` followed by two characters to instantly jump to any word on the screen that starts with those characters.

### 3. Plugin Usage

Here is a summary of the key plugins and their most common uses:

*   **`coc.nvim`:** The engine for all things LSP. You don't need to interact with it directly much, as it works automatically. The key mappings above are the primary way you will use it.
*   **`fzf.vim`:** The fuzzy finder. You will use it constantly for finding files and searching for code.
*   **`NERDTree`:** The file explorer. Use it for a visual overview of your project.
*   **`vim-fugitive`:** The Git integration. The most common command is `:Gstatus`, which opens a Git status window. You can also use `:Gblame`, `:Gdiff`, and many other commands.
*   **`nerdcommenter`:** The code commenter. Press `<leader>c<space>` to toggle comments on a line or a visual selection.
*   **`vim-surround`:** The surround tool. This is a very powerful plugin for working with pairs of delimiters (e.g., parentheses, quotes). For example, you can change single quotes to double quotes by typing `cs'"`.

### 4. Other Tips

*   **Clear Search Highlight:** Press `<leader><space>` to clear the highlighting from the last search.
*   **Change Colorscheme:** Use the `:colorscheme` command to change the colorscheme. You can choose from `dracula`, `solarized`, or `space-vim-dark`.
*   **Add New Plugins:** To add a new plugin, add a `Plug` command to your `~/.config/nvim/init.vim` file and then run `:PlugInstall` in Neovim.
*   **Customize:** This configuration is just a starting point. Feel free to customize it to your heart's content by editing your `~/.config/nvim/init.vim` file.