{...}:

{
  imports = [
    (builtins.fetchTarball {
      url = "https://github.com/jplana/forticlient-nixos/archive/main.tar.gz";
      # sha256 = "…"; # pin this for reproducibility (nix-prefetch-url --unpack <url>)
    })
  ];

  services.forticlient.enable = true;
  #services.forticlient.gnomeKeyring.pamServices = [ "login" "sddm" ];
}
