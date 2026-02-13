{ config, lib, pkgs, systemSettings, home-manager, ... }:

let 
  username = "charlotte";
in
{
  imports = [];


	users.users.${username} = {
    isNormalUser = true;
    description = username;
    shell = lib.mkForce pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
      neovim
      chezmoi
      hyfetch
      pinta
      wpaperd
      discord
      libreoffice
    ];
  };

  home-manager.backupFileExtension = "backup";

  home-manager.users.${username} = {
	  home.username = username;
	  home.homeDirectory = "/home/"+username;

	  programs.git = {
	    enable = true;
	    settings = {
	      user = {
	        name = "chezLotti";
          email = "charlottelhaw@gmail.com";
	      };
        init.defaultBranch = "main";
	    };

	  };

	  wayland.windowManager.hyprland = {
      systemd.enable = false;
      systemd.variables = ["--all"];
    };
    programs.kitty = {
      enable = true;
      settings = {
        include = "goth-theme.conf";
        font_family = "Victor Mono";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = "12";
      };
    };

	  home.stateVersion = systemSettings.stateVersion;

	  home.packages = with pkgs; [];

	  home.file = {};

	  home.sessionVariables = {
	    # EDITOR = "emacs";
	  };

	  # Let Home Manager install and manage itself.
	  programs.home-manager.enable = true;
  };
}
