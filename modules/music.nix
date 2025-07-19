{ ... }:

{
  # Music daemon
  services.mpd = {
    enable = true;
    musicDirectory = /home/blackwew/Music;
    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Pipewire_OUT"
      }
    '';
  };
  # Music player
  programs.rmpc = {
    enable = true;
    # config = ''
    #   (

    # )
    # '';
  };
}
