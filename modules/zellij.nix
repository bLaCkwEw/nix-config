{ ... }:

{
	# Zellij
	programs.zellij = {
		enable = true;
		enableFishIntegration= false;
		settings = {
			default_mode = "locked";
			on_force_close = "quit";
			copy_on_select = false;
		};
	};
}
