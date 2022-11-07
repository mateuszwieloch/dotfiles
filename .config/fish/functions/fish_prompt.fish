set __fish_git_prompt_showstashstate 1
set __fish_git_prompt_show_informative_status 'yes'

set __fish_git_prompt_color_branch 'green'

set __fish_git_prompt_char_stateseparator ' '

set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_color_cleanstate 'green'

set __fish_git_prompt_char_stagedstate 's'
set __fish_git_prompt_color_stagedstate 'yellow'

set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_color_dirtystate 'F00'

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_char_untrackedfiles 'u'
set __fish_git_prompt_color_untrackedfiles 'magenta'

set __fish_git_prompt_char_invalidstate 'x'


function long_working_dir --description 'Print the current working directory'
  echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end


# ~/path/to/dir master↑3↓2 s1+4 $
function fish_prompt --description 'Write out the prompt'
  set_color yellow
  printf '%s ' (long_working_dir)
  set_color normal
	printf '%s' (__fish_git_prompt "%s ")
  set_color $mode_color
  printf '$ '

	set_color normal
end
