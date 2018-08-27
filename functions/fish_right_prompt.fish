function fish_right_prompt -d "Write out the right prompt"
  set -l exit_code $status
  set -l is_git_repository (git rev-parse --is-inside-work-tree ^/dev/null)

  set_color black


  # Print a yellow fork symbol when in a subshell
  set -l max_shlvl 1
  test $TERM = "screen"; and set -l max_shlvl 3
  if test $SHLVL -gt $max_shlvl
    set_color yellow
    echo -n "⑂ "
    set_color black
  end

  # Print a red dot for failed commands.
  if test $exit_code -ne 0
    set_color red
    echo -n "• "
    set_color black
  end



  # Print coloured arrows when git push (up) and / or git pull (down) can be run.
  #
  # Red means the local branch and the upstream branch have diverted.
  # Yellow means there are more than 3 commits to push or pull.
  if test -n "$is_git_repository"
    git rev-parse --abbrev-ref '@{upstream}' >/dev/null ^&1; and set -l has_upstream
    if set -q has_upstream
      set -l commit_counts (git rev-list --left-right --count 'HEAD...@{upstream}' ^/dev/null)

      set -l commits_to_push (echo $commit_counts | cut -f 1 ^/dev/null)
      set -l commits_to_pull (echo $commit_counts | cut -f 2 ^/dev/null)

      if test $commits_to_push != 0
        if test $commits_to_pull -ne 0
          set_color red
        else if test $commits_to_push -gt 3
          set_color yellow
        else
          set_color green
        end

        echo -n "⇡ "
      end

      if test $commits_to_pull != 0
        if test $commits_to_push -ne 0
          set_color red
        else if test $commits_to_pull -gt 3
          set_color yellow
        else
          set_color green
        end

        echo -n "⇣ "
      end

      set_color black
    end

    # Print a "stack symbol" if there are stashed changes.
    if test (git stash list | wc -l) -gt 0
      echo -n "☰ "
    end
  end

  set_color normal
end
