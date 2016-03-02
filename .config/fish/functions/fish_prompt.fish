set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'

# separator between branch name and flags
# set __fish_git_prompt_color_branch normal
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_char_invalidstate 'x'
set __fish_git_prompt_char_stagedstate 's'
set __fish_git_prompt_char_untrackedfiles 'u'


function long_working_dir --description 'Print the current working directory'
  echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end


function fish_prompt --description 'Write out the prompt'
  if not test $status -eq 0
    set -l mode_color red
  else
    set -l mode_color normal
  end

  set_color green
  printf '%s' (long_working_dir)
  set_color normal
	printf '%s ' (__fish_git_prompt)
  set_color $mode_color
  printf '$ '

	set_color normal
end
