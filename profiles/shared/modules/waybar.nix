{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 8;

        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "niri/language"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "tray"
        ];

        "niri/workspaces" = {
          format = "{index}";
          on-click = "activate";
        };

        "niri/window" = {
          format = "{}";
          max-length = 50;
          separate-outputs = true;
        };

        "niri/language" = {
          format = " {}";
          format-colemak_caws = "  Colemak-CAWS";
          format-rulemak_caws = "  Rulemak-CAWS";
          min-length = 5;
          tooltip = true;
        };

        clock = {
          interval = 1;
          format = "{:%H:%M:%S}";
          format-alt = "{:%A, %d %B %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#88c0d0'><b>{}</b></span>";
              days = "<span color='#d8dee9'><b>{}</b></span>";
              weeks = "<span color='#81a1c1'><b>W{}</b></span>";
              weekdays = "<span color='#8fbcbb'><b>{}</b></span>";
              today = "<span color='#bf616a'><b><u>{}</u></b></span>";
            };
          };
        };

        cpu = {
          interval = 2;
          format = "  {usage}%";
          tooltip = true;
          min-length = 5;
        };

        memory = {
          interval = 2;
          format = "  {}%";
          tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G";
          min-length = 5;
        };

        temperature = {
          interval = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" "" "" ""];
          tooltip = true;
        };

        battery = {
          interval = 10;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["" "" "" "" ""];
          tooltip-format = "{timeTo}\n{power}W";
        };

        network = {
          interval = 2;
          format-wifi = " {signalStrength}%";
          format-ethernet = "󰩟 {ipaddr}";
          format-disconnected = " Disconnected";
          tooltip-format = "{essid}\n{ipaddr}/{cidr}\n {bandwidthDownBits}  {bandwidthUpBits}";
          on-click = "nmtui";
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon}   {volume}%";
          format-muted = " Muted";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          tooltip-format = "{desc}\n{volume}%";
          min-length = 5;
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        font-weight: 500;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: rgba(46, 52, 64, 0.9);
        color: #eceff4;
        border-bottom: 2px solid #81a1c1;
      }

      #workspaces {
        background: transparent;
        margin: 5px 5px 5px 10px;
        padding: 0;
      }

      #workspaces button {
        padding: 0 8px;
        color: #d8dee9;
        background: transparent;
        border-radius: 8px;
        margin: 0 3px;
        transition: all 0.3s;
      }

      #workspaces button:hover {
        background: rgba(129, 161, 193, 0.3);
        color: #eceff4;
      }

      #workspaces button.active {
        background: #81a1c1;
        color: #2e3440;
      }

      #workspaces button.urgent {
        background: #bf616a;
        color: #eceff4;
      }

      #window {
        margin: 5px 10px;
        padding: 2px 12px;
        color: #88c0d0;
        font-weight: 600;
      }

      #clock {
        margin: 5px;
        padding: 2px 16px;
        background: #81a1c1;
        color: #2e3440;
        border-radius: 8px;
        font-weight: 700;
      }

      #language,
      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #temperature,
      #battery,
      #tray {
        margin: 5px 2px;
        padding: 2px 10px;
        background: rgba(67, 76, 94, 0.6);
        color: #eceff4;
        border-radius: 8px;
      }

      #language {
        color: #8fbcbb;
      }

      #pulseaudio {
        color: #88c0d0;
      }

      #network {
        color: #a3be8c;
      }

      #cpu {
        color: #ebcb8b;
      }

      #memory {
        color: #d08770;
      }

      #temperature {
        color: #bf616a;
      }

      #temperature.critical {
        background: #bf616a;
        color: #eceff4;
        animation: blink 1s linear infinite;
      }

      @keyframes blink {
        to {
          background-color: rgba(191, 97, 106, 0.5);
        }
      }

      #battery {
        color: #a3be8c;
      }

      #battery.warning {
        color: #ebcb8b;
      }

      #battery.critical {
        color: #bf616a;
      }

      #battery.charging {
        color: #8fbcbb;
      }

      #idle_inhibitor.activated {
        color: #ebcb8b;
      }

      #tray {
        margin-right: 10px;
        padding: 2px 6px;
      }

      tooltip {
        background: rgba(46, 52, 64, 0.95);
        border: 2px solid #81a1c1;
        border-radius: 8px;
        color: #eceff4;
      }

      tooltip label {
        color: #eceff4;
      }
    '';
  };
}
