{ config, pkgs, lib, username, ... }:

{
	users.users.${username} = {
    isNormalUser = true;
    description = username;
    shell = lib.mkForce pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
      neovim
      chezmoi
      hyfetch
    ];
  };
}