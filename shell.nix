{ pkgs ? import <nixpkgs> {
  # overlays = [(import (builtins.fetchTarball {url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;}))];
}
}:
with pkgs;
let
  my-python-packages = python-packages:
    with python-packages;
    [
      ptpython
      # other python packages you want
    ];
  python-with-my-packages = python3.withPackages my-python-packages;

  neovimPythonPackages = p: with p; [ jedi flake8 black pylint ];
  neovim = pkgs.neovim.override {
    extraPython3Packages = neovimPythonPackages;
    withPython3 = true;
    withNodeJs = true;
  };
in mkShell {
  buildInputs = [
    # Customized packages
    python-with-my-packages
    tmux
    git
    nixpkgs-fmt
    # neovim-nightly
    neovim
    cowsay
    jq
    lazygit
    libxml2

    fd
    ripgrep
    fzf
    silver-searcher
    nodePackages.diagnostic-languageserver
    nodePackages.json-server
    nodePackages.pyright
    nodePackages.prettier
    nodePackages.typescript-language-server
#    rnix-lsp
    rust-analyzer
    clang-tools
    postgresql
    (lib.optional pkgs.stdenv.isLinux sumneko-lua-language-server)
  ];

  shellHook = ''
    mkdir -p ~/nix-neovim/local/share/nvim
    mkdir -p ~/nix-neovim/local/share/nvim/site/pack/packer/start
    set -a
    source ~/nix-neovim/env.sh
    set +a
    alias nvim="nvim -u ~/nix-neovim/config/nvim/init.lua"
    nvim
  '';
}
