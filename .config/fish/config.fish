if status is-interactive
    # Commands to run in interactive sessions can go here
    #eval (zellij setup --generate-auto-start fish | string collect)
end

# Set PATH
if status --is-login
    set -gx PATH $PATH ~/.local/bin
end

# Disable fish greeting
set -U fish_greeting

# Set default apps
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx BROWSER firefox

# Fzf options
set fzf_preview_dir_cmd lsd --all --color=always
set fzf_preview_file_cmd bat -n --color=always
set fzf_fd_opts --hidden --max-depth 5

eval (zoxide init fish | source)
# eval (starship init fish | source)
