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
    zoom-us
    zip
    unzip
    gnutar
  ];
}
