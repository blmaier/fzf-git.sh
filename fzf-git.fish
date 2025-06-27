# fzf-git keybindings for fish

set __fzf_git_path (realpath (status dirname))/fzf-git.sh
if ! test -f $__fzf_git_path
    echo "Failed to find fzf-git.sh at $__fzf_git_path" >&2
else
    function __fzf_git_cmd
        commandline -i (SHELL=bash bash "$__fzf_git_path" --run $argv[1] | string join " ")
    end

    function __fzf_git_init
        for o in files branches tags remotes hashes stashes lreflogs each_ref worktrees
            set c (string sub -l 1 $o)
            bind ctrl-g,$c "__fzf_git_cmd $o" repaint
            bind ctrl-g,ctrl-$c "__fzf_git_cmd $o" repaint
        end
    end
    __fzf_git_init
end
