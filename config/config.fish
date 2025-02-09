set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

set -g fish_greeting

if status is-interactive
    zoxide init fish | source
    starship init fish | source
end