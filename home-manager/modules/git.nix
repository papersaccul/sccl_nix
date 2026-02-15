{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "papersaccul";
        email = "papersacculos@outlook.com";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "vim";

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "log --graph --oneline --all";
      };
    };
  };
}
