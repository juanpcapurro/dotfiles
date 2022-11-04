if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr fatvim nvim -u ~/.config/nvim/fat.vim
    abbr xclipc xclip -selection clipboard
    abbr config /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
    abbr gst git status
    abbr gsh git show
    abbr ga git add
    abbr gf git fetch
    abbr gd git diff
    abbr gco git checkout
    abbr gc git commit
    abbr g git

    function prompt_login --description 'display user name for the prompt'
        echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) 
    end

end

export EDITOR=nvim
export PATH="$PATH:/home/capu/.foundry/bin"
