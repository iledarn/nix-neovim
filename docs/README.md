Nixifying my Neovim
===================

## Objective

To have a quick, consistent, and isolated way of Neovim installation itself along with my customizations of it and installed pre-requisites.

## Why Nix

My first thought, prior I knew about [Nix](https://nixos.org/guides/how-nix-works.html), was to use Docker to meet the objective.
I even found others' people implementations - for example, [this one](https://github.com/MashMB/nvim-ide).
But it always feels awkward. Docker is perfect for running services, not being an IDE tool platform.
Once I see what capabilities Nix provides, I immediately start to think about it in the context of my portable Neovim IDE.
There is a project already that I plan to use as a starting point - [A starting point for neovim](https://github.com/nvim-lua/kickstart.nvim).
It looks very promising.

## Usage

```
cd $HOME
git clone https://github.com/iledarn/nix-neovim.git
from project's root folder:
nix-shell ~/nix-neovim/shell.nix
nvim opens
:PackerInstall
```

