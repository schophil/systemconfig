set -U fish_color_normal normal
set -U fish_color_command 81a1c1
set -U fish_color_quote a3be8c
set -U fish_color_redirection b48ead
set -U fish_color_end 88c0d0
set -U fish_color_error ebcb8b
set -U fish_color_param eceff4
set -U fish_color_comment 434c5e
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 4c566a
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x EDITOR vim

set -x EXTTRA_PATHS ~/.npm-global/bin /opt/local/bin /opt/local/sbin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ~/tools/node/bin ~/bin ~/tools/idea/bin ~/tools/kubectx ~/.local/bin ~/tools/jmeter/bin

# set -x JAVA_HOME "temp"

set -x PATH_ORG $PATH

function compose_path
  # reset path
  set -x PATH $PATH_ORG
  # add the extras
  for extra in $EXTTRA_PATHS
    if test -d $extra
      set -x PATH $extra $PATH
    end
  end
end

fish_vi_key_bindings
compose_path

set -e PATH_ORG
direnv hook fish | source
