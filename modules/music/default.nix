{ ... }:
{
  services = {
    # Music daemon
    mpd = {
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
    # Media keys & notification support for MPD
    mpdris2 = {
      enable = true;
      notifications = false;
      multimediaKeys = true;
    };

    # ListenBrainz
    listenbrainz-mpd = {
      enable = true;
      settings = {
        submission = {
          token_file = "/home/blackwew/.listenbrainz_token";
        };
      };
    };
  };
  # Music player
  programs.rmpc = {
    enable = true;
  };

  home.file = {
    ".config/rmpc" = {
      source = ./rmpc;
      recursive = true;
    };
  };
}
