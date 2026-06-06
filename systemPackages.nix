{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		gcc
    wget
    git
    curl
    btop
    freerdp
    vim
    jetbrains.idea
    discord
    remmina
    zip
    unzip
    gnutar
    pavucontrol
    nodejs_24
  ];
}
