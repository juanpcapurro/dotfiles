if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -g fatvim nvim -u ~/.config/nvim/fat.vim
    abbr -a -g sc-im TERM=xterm-256color sc-im
    abbr -a -g xclipc xclip -selection clipboard
    abbr -a -g config /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
    abbr -a -g gst git status
    abbr -a -g gsh git show
    abbr -a -g ga git add
    abbr -a -g gf git fetch
    abbr -a -g gd git diff
    abbr -a -g glog git log --graph --oneline
    abbr -a -g gco git checkout
    abbr -a -g gc git commit
    abbr -a -g g git

    source /usr/share/autojump/autojump.fish
    nvm use lts

    function prompt_login --description 'display user name for the prompt'
        echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) 
    end

    function prompt_login --description 'display user name for the prompt'
        echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) 
    end

    fish_vi_key_bindings
    fzf_configure_bindings --directory=\cf
    set -gx fzf_preview_file_cmd 'batcat --style=numbers --color=always'

    set fish_cursor_default underscore
    set fish_cursor_insert line
    set fish_cursor_replace_one block
    set fish_cursor_replace block
    set fish_cursor_visual block
end


export EDITOR=nvim
export PATH="$PATH:$HOME/.foundry/bin:$HOME/go/bin:$HOME/.cargo/bin/"
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
