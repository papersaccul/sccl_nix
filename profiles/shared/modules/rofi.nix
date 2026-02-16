{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Window";
      sidebar-mode = false;
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#2e3440";
        bg-alt = mkLiteral "#3b4252";
        fg = mkLiteral "#eceff4";
        fg-alt = mkLiteral "#d8dee9";

        background-color = mkLiteral "@bg";
        border = mkLiteral "0";
        margin = mkLiteral "0";
        padding = mkLiteral "0";
        spacing = mkLiteral "0";
      };

      "window" = {
        width = mkLiteral "30%";
        background-color = mkLiteral "@bg";
        border-radius = mkLiteral "10px";
      };

      "element" = {
        padding = mkLiteral "8px 12px";
        spacing = mkLiteral "8px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg-alt";
      };

      "element selected" = {
        text-color = mkLiteral "@fg";
        background-color = mkLiteral "#81a1c1";  # Nord blue
        border-radius = mkLiteral "6px";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };

      "element-icon" = {
        size = mkLiteral "24px";
        background-color = mkLiteral "transparent";
      };

      "entry" = {
        padding = mkLiteral "12px";
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
        border-radius = mkLiteral "6px";
      };

      "inputbar" = {
        children = mkLiteral "[prompt,entry]";
        padding = mkLiteral "12px";
        background-color = mkLiteral "@bg";
      };

      "listview" = {
        columns = mkLiteral "1";
        lines = mkLiteral "8";
        cycle = mkLiteral "false";
        dynamic = mkLiteral "true";
        layout = mkLiteral "vertical";
        padding = mkLiteral "8px";
      };

      "mainbox" = {
        children = mkLiteral "[inputbar,listview]";
        background-color = mkLiteral "@bg";
      };

      "prompt" = {
        enabled = mkLiteral "true";
        padding = mkLiteral "12px 0 0 12px";
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "#88c0d0";  # Nord cyan
      };
    };
  };
}
