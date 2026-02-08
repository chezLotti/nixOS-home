{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland
    hyprlock
    hyprpaper
    hyprsunset
    hyprpicker
    hypridle
    hyprpolkitagent
    waybar
    wofi
    kitty
    swaynotificationcenter
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };
}
