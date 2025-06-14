{...}: {
  # Fish Shell
  programs.fish = {
    enable = true;

    shellAliases = {
      # Various aliases
      c = "clear";
      e = "exit";
      q = "exit";
      h = "history --max=10";
      rm = "rm -drvI";
      cat = "bat";
      pnpr = "pnpm run";
      # Git
      gs = "git status";
      gc = "git commit -v";
      gcd = "git commit -v -m $(date +'%Y-%m-%d %H:%M')";
      ga = "git add";
      gaa = "git add .";
      gpu = "git pull";
      gps = "git push";
    };

    shellInitLast = ''
      			function _autopair_backspace
      		set --local index (commandline --cursor)
      		set --local buffer (commandline)

      		test $index -ge 1 &&
      				contains -- (string sub --start=$index --length=2 -- "$buffer") $autopair_pairs &&
      				commandline --function delete-char
      		commandline --function backward-delete-char
      end

      function _autopair_insert_left --argument-names left right
      		set --local buffer (commandline)
      		set --local before (commandline --cut-at-cursor)

      		commandline --insert -- $left

      		switch "$buffer"
      				case "$before"{," "\*,$autopair_right\*}
      						set --local index (commandline --cursor)
      						commandline --insert -- $right
      						commandline --cursor $index
      		end
      end

      function _autopair_insert_right --argument-names key
      		set --local buffer (commandline)
      		set --local before (commandline --cut-at-cursor)

      		switch "$buffer"
      				case "$before$key"\*
      						commandline --cursor (math (commandline --cursor) + 1)
      				case \*
      						commandline --insert -- $key
      		end
      end

      function _autopair_insert_same --argument-names key
      		set --local buffer (commandline)
      		set --local index (commandline --cursor)
      		set --local next (string sub --start=(math $index + 1) --length=1 -- "$buffer")

      		if test (math (count (string match --all --regex -- "$key" "$buffer")) % 2) = 0
      				test $key = $next && commandline --cursor (math $index + 1) && return

      				commandline --insert -- $key

      				if test $index -lt 1 ||
      								contains -- (string sub --start=$index --length=1 -- "$buffer") "" " " $autopair_left &&
      								contains -- $next "" " " $autopair_right
      						commandline --insert -- $key
      						commandline --cursor (math $index + 1)
      				end
      		else
      				commandline --insert -- $key
      		end
      end

      function _autopair_tab
      		commandline --paging-mode && down-or-search && return

      		string match --quiet --regex -- '\$[^\s]*"$' (commandline --current-token) &&
      				commandline --function end-of-line --function backward-delete-char
      		commandline --function complete
      end

      function fish_greeting
      	microfetch
      end

      function fish_prompt --description 'Write out the prompt'
      		set -l last_pipestatus $pipestatus
      		set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
      		set -l normal (set_color normal)
      		set -q fish_color_status
      		or set -g fish_color_status --background=red white

      		# Color the prompt differently when we're root
      		set -l color_cwd $fish_color_cwd
      		set -l suffix '>'
      		if functions -q fish_is_root_user; and fish_is_root_user
      				if set -q fish_color_cwd_root
      						set color_cwd $fish_color_cwd_root
      				end
      				set suffix '#'
      		end

      		# Write pipestatus
      		# If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
      		set -l bold_flag --bold
      		set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
      		if test $__fish_prompt_status_generation = $status_generation
      				set bold_flag
      		end
      		set __fish_prompt_status_generation $status_generation
      		set -l status_color (set_color $fish_color_status)
      		set -l statusb_color (set_color $bold_flag $fish_color_status)
      		set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

      		echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
      end

      function __history_previous_command
      	switch (commandline -t)
      	case "!"
      		commandline -t $history[1]; commandline -f repaint
      	case "*"
      		commandline -i !
      	end
      end

      function __history_previous_command_arguments
      	switch (commandline -t)
      	case "!"
      		commandline -t ""
      		commandline -f history-token-search-backward
      	case "*"
      		commandline -i '$'
      	end
      end

      function man --wraps man --description 'Format and display manual pages'
      		set -q man_blink; and set -l blink (set_color $man_blink); or set -l blink (set_color -o red)
      		set -q man_bold; and set -l bold (set_color $man_bold); or set -l bold (set_color -o bd93f9)
      		set -q man_standout; and set -l standout (set_color $man_standout); or set -l standout (set_color 6272a4)
      		set -q man_underline; and set -l underline (set_color $man_underline); or set -l underline (set_color -u ff79c6)

      		set -l end (printf "\e[0m")

      		set -lx LESS_TERMCAP_mb $blink
      		set -lx LESS_TERMCAP_md $bold
      		set -lx LESS_TERMCAP_me $end
      		set -lx LESS_TERMCAP_so $standout
      		set -lx LESS_TERMCAP_se $end
      		set -lx LESS_TERMCAP_us $underline
      		set -lx LESS_TERMCAP_ue $end
      		set -lx LESS '-R -s'

      		set -lx GROFF_NO_SGR yes # fedora

      		set -lx MANPATH (string join : $MANPATH)
      		if test -z "$MANPATH"
      				type -q manpath
      				and set MANPATH (command manpath)
      		end

      		# Check data dir for Fish 2.x compatibility
      		set -l fish_data_dir
      		if set -q __fish_data_dir
      				set fish_data_dir $__fish_data_dir
      		else
      				set fish_data_dir $__fish_datadir
      		end

      		set -l fish_manpath (dirname $fish_data_dir)/fish/man
      		if test -d "$fish_manpath" -a -n "$MANPATH"
      				set MANPATH "$fish_manpath":$MANPATH
      				command man $argv
      				return
      		end
      		command man $argv
      end
    '';
  };
}
