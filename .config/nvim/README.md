# My neovim config

TODO: Include + explain each installed plugin + images

# Installation
I work in Ubuntu WSL, to replicate my nvim environment:

## Install neovim
Visit the [neovim installation guide.](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux) 

## Install dependencies
Some of the installed plugins depend on tools installed on the system.

### [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
Required for live grepping files with [Telescope](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#suggested-dependencies).

```bash
sudo apt install ripgrep
```

### [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu)
Required for the lazygit gui in neovim.

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```
