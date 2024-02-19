{ ... }:

{
  # MPV
  programs.mpv = {
  	enable = true;
  	bindings = {
  		WHEEL_UP = "ignore";
  		WHEEL_DOWN = "ignore";
  	};
  	config = {
  		fullscreen = "yes";
  		keep-open = "always";
  		force-seekable = "yes";
  		osd-bar = "no";
  	};
  };
}
