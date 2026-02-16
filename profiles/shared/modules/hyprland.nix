{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    systemd.variables = ["XKB_CONFIG_ROOT"];

    settings = {
      "$mod" = "SUPER";

      # Nord цвета
      "$nord0" = "rgb(2e3440)";   # Polar Night - самый темный
      "$nord1" = "rgb(3b4252)";   # Polar Night
      "$nord2" = "rgb(434c5e)";   # Polar Night
      "$nord3" = "rgb(4c566a)";   # Polar Night - самый светлый
      "$nord4" = "rgb(d8dee9)";   # Snow Storm
      "$nord5" = "rgb(e5e9f0)";   # Snow Storm
      "$nord6" = "rgb(eceff4)";   # Snow Storm - белый
      "$nord7" = "rgb(8fbcbb)";   # Frost - cyan
      "$nord8" = "rgb(88c0d0)";   # Frost - light blue
      "$nord9" = "rgb(81a1c1)";   # Frost - blue
      "$nord10" = "rgb(5e81ac)";  # Frost - dark blue
      "$nord11" = "rgb(bf616a)";  # Aurora - red
      "$nord12" = "rgb(d08770)";  # Aurora - orange
      "$nord13" = "rgb(ebcb8b)";  # Aurora - yellow
      "$nord14" = "rgb(a3be8c)";  # Aurora - green
      "$nord15" = "rgb(b48ead)";  # Aurora - purple

      monitor = ",2560x1440@500,auto,1";

      input = {
        kb_layout = "colemak_caws,rulemak_caws";
        kb_options = "caps:backspace,grp:rwin_toggle,lv3:ralt_switch";
        follow_mouse = 1;
        sensitivity = -0.8;
        touchpad = {
          natural_scroll = false;
        };
      };

    # Colemak Bindings
      bind = [
        "$mod, Return, exec, alacritty"
        "$mod, A, exec, rofi -show drun"
        "$mod, F, exec, thunar"
        "$mod, Q, killactive"
        "$mod SHIFT, Q, forcekillactive"

        "$mod, T, togglefloating"
        "$mod SHIFT, T, fullscreen"
    #   "$mod, P, pseudo"
        "$mod, J, togglesplit"

        "$mod, W, movefocus, l"
        "$mod, S, movefocus, r"
        "$mod, R, movefocus, d"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, ESCAPE, workspace, previous"
        "$mod, TAB, exec, rofi -show window"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod SHIFT, A, exec, grim -g \"$(slurp)\" ~/Pictures/$(date +'%Y%m%d_%H%M%S').png"
        "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      exec-once = [
        "waybar"
        "dunst"
      ];

      general = {
        gaps_in = lib.mkForce 5;
        gaps_out = lib.mkForce 10;
        border_size = lib.mkForce 2;

        "col.active_border" = lib.mkForce "$nord9 $nord15 45deg";
        "col.inactive_border" = lib.mkForce "$nord3";

        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = false;
      };

      decoration = {
        rounding = lib.mkForce 10;

        blur = {
          enabled = true;
          size = 6;
          passes = 2;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = lib.mkForce 0;
        disable_hyprland_logo = lib.mkForce true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        vrr = 2;
      };
    };
  };

  home.file.".xkb/symbols/colemak_caws".text = ''
    default partial alphanumeric_keys
    xkb_symbols "basic" {
      name[Group1]= "Colemak-CAWS";
      #include "us(basic)"

      key <TLDE> { [ grave, asciitilde ] };
      key <AE01> { [ 1, exclam ] };
      key <AE02> { [ 2, at ] };
      key <AE03> { [ 3, numbersign ] };
      key <AE04> { [ 4, dollar ] };
      key <AE05> { [ 5, percent ] };
      key <AE06> { [ 6, asciicircum ] };
      key <AE07> { [ backslash, bar ] };
      key <AE08> { [ 7, ampersand ] };
      key <AE09> { [ 8, asterisk ] };
      key <AE10> { [ 9, parenleft ] };
      key <AE11> { [ 0, parenright ] };
      key <AE12> { [ equal, plus ] };

      key <AD01> { [ q, Q ] };
      key <AD02> { [ w, W ] };
      key <AD03> { [ f, F ] };
      key <AD04> { [ p, P ] };
      key <AD05> { [ b, B ] };
      key <AD06> { [ bracketleft, braceleft ] };
      key <AD07> { [ j, J ] };
      key <AD08> { [ l, L ] };
      key <AD09> { [ u, U ] };
      key <AD10> { [ y, Y ] };
      key <AD11> { [ apostrophe, quotedbl ] };
      key <AD12> { [ minus, underscore ] };
      key <BKSL> { [ semicolon, colon] };

      key <AC01> { [ a, A ] };
      key <AC02> { [ r, R ] };
      key <AC03> { [ s, S ] };
      key <AC04> { [ t, T ] };
      key <AC05> { [ g, G ] };
      key <AC06> { [ bracketright, braceright ] };
      key <AC07> { [ m, M ] };
      key <AC08> { [ n, N ] };
      key <AC09> { [ e, E ] };
      key <AC10> { [ i, I ] };
      key <AC11> { [ o, O ] };

      key <AB01> { [ x, X ] };
      key <AB02> { [ c, C ] };
      key <AB03> { [ d, D ] };
      key <AB04> { [ v, V ] };
      key <AB05> { [ z, Z ] };
      key <AB06> { [ slash, question ] };
      key <AB07> { [ k, K ] };
      key <AB08> { [ h, H ] };
      key <AB09> { [ comma, less ] };
      key <AB10> { [ period, greater ] };
    };
  '';

  home.file.".xkb/symbols/rulemak_caws".text = ''
    default partial alphanumeric_keys
    xkb_symbols "basic" {
      name[Group1]= "Rulemak-CAWS";

      key <TLDE> { [ Cyrillic_io, Cyrillic_IO ] };
      key <AE01> { [ 1, exclam ] };
      key <AE02> { [ 2, quotedbl ] };
      key <AE03> { [ 3, numerosign ] };
      key <AE04> { [ 4, U20BD ] };
      key <AE05> { [ 5, percent ] };
      key <AE06> { [ 6, asciicircum ] };
      key <AE07> { [ Cyrillic_e, Cyrillic_E ] };
      key <AE08> { [ 7, ampersand ] };
      key <AE09> { [ 8, asterisk ] };
      key <AE10> { [ 9, parenleft ] };
      key <AE11> { [ 0, parenright ] };
      key <AE12> { [ Cyrillic_hardsign, Cyrillic_HARDSIGN ] };

      key <AD01> { [ Cyrillic_ya, Cyrillic_YA ] };
      key <AD02> { [ Cyrillic_zhe, Cyrillic_ZHE ] };
      key <AD03> { [ Cyrillic_ef, Cyrillic_EF ] };
      key <AD04> { [ Cyrillic_pe, Cyrillic_PE ] };
      key <AD05> { [ Cyrillic_be, Cyrillic_BE ] };
      key <AD06> { [ Cyrillic_sha, Cyrillic_SHA ] };
      key <AD07> { [ Cyrillic_shorti, Cyrillic_SHORTI ] };
      key <AD08> { [ Cyrillic_el, Cyrillic_EL ] };
      key <AD09> { [ Cyrillic_u, Cyrillic_U ] };
      key <AD10> { [ Cyrillic_yeru, Cyrillic_YERU ] };
      key <AD11> { [ Cyrillic_softsign, Cyrillic_SOFTSIGN ] };
      key <AD12> { [ minus, underscore ] };
      key <BKSL> { [ Cyrillic_yu, Cyrillic_YU ] };

      key <AC01> { [ Cyrillic_a, Cyrillic_A ] };
      key <AC02> { [ Cyrillic_er, Cyrillic_ER ] };
      key <AC03> { [ Cyrillic_es, Cyrillic_ES ] };
      key <AC04> { [ Cyrillic_te, Cyrillic_TE ] };
      key <AC05> { [ Cyrillic_ghe, Cyrillic_GHE ] };
      key <AC06> { [ Cyrillic_shcha, Cyrillic_SHCHA ] };
      key <AC07> { [ Cyrillic_em, Cyrillic_EM ] };
      key <AC08> { [ Cyrillic_en, Cyrillic_EN ] };
      key <AC09> { [ Cyrillic_ie, Cyrillic_IE, Cyrillic_io, Cyrillic_IO ] };
      key <AC10> { [ Cyrillic_i, Cyrillic_I ] };
      key <AC11> { [ Cyrillic_o, Cyrillic_O ] };

      key <AB01> { [ Cyrillic_ha, Cyrillic_HA ] };
      key <AB02> { [ Cyrillic_tse, Cyrillic_TSE ] };
      key <AB03> { [ Cyrillic_de, Cyrillic_DE ] };
      key <AB04> { [ Cyrillic_ve, Cyrillic_VE ] };
      key <AB05> { [ Cyrillic_ze, Cyrillic_ZE ] };
      key <AB06> { [ slash, question ] };
      key <AB07> { [ Cyrillic_ka, Cyrillic_KA ] };
      key <AB08> { [ Cyrillic_che, Cyrillic_CHE ] };
      key <AB09> { [ comma, semicolon ] };
      key <AB10> { [ period, colon ] };

      key <SPCE> { [ space ] };
    };
  '';
}
