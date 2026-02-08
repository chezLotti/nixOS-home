{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
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
  ];
}
