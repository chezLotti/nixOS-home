{ config, pkgs, ... }:
let 
  baseAliases = {
    ll = "ls -la";
    ".." = "cd ..";
  };
in
{
	environment.shells = with pkgs; [
    bash
    fish
    zsh
  ];

  users.defaultUserShell = pkgs.bash;

  programs = {
    bash.enable = true;
    fish.enable = true;
    zsh.enable = true;

    bash.shellAliases = baseAliases;
    fish.shellAliases = baseAliases;
    zsh.shellAliases = baseAliases;
  };
}
