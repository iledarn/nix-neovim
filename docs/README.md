Nixifying my Neovim
===================

## Objective

Been using Neovim for more than five years now I constantly improving its configuration - adding new plugins and customizing it by hand in my 
[init.vim](https://github.com/iledarn/configfiles/blob/master/init.vim).
It is like treasure hunting for me - seeing other's configurations on GitHub. I'm using it like IDE on a daily basis on work, private, and VPS
machines. On my work notebook, I have Ubuntu, on my private one - Archlinux I had for some time. You see, these distributions have different versions of Neovim in their package managers repos.
Archlinux has more recent versions for example and I had to install it from source code on Ubuntu - only to have the same versions.
Need to say that it takes quite a lot of time to install and configure it consistently in different environments for me. Also on VPS (clients servers mostly)
it better be isolated - which I didn't know how to achieve up to this point.
So my objective - to have a quick, consistent, and isolated way of Neovim installation itself along with my customizations of it.

## Why Nix

My first thought, prior I knew about [Nix](https://nixos.org/guides/how-nix-works.html), was to use Docker to meet the objective.
I even found others' people implementations - for example, [this one](https://github.com/MashMB/nvim-ide).
But it always feels awkward. Docker is perfect for running services, not being an IDE tool.
Once I see what capabilities Nix provides, I immediately start to think about it in the context of my portable Neovim IDE.
There is a project already that I plan to use as a starting point - [A starting point for neovim](https://github.com/nvim-lua/kickstart.nvim).
It looks very promising.




