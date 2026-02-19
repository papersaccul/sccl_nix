{ config, pkgs, ... }:

{
  # uwuwuwuwuwuwuwuwu ascii
  home.file.".config/hyfetch/nixowos.txt".text = ''
           ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖
           ▜███▙       ▜███▙  ▟███▛
            ▜███▙       ▜███▙▟███▛       ▗
     ▐▄      ▜███▙       ▜██████▛    ▄▄▞▀▛
      ▜▀▀▀▄▄  ▜█████████▙ ▜████▛  ▄█▛▀  ▗▘
       ▌   ▀█▄▟██████████▙ ▜███▙▟█▛    ▗▞
       ▐  ▙▖▟▙▄▄▖           ▜████▙▄▟▘  ▟▘
        ▜▖▝████▛             ▜██▛██▄▄▄▞▘
         ▝▟███▛ ▀▚▄       ▄▞▀ ▜▛ ▟███▛
 ▟███████████▛ ▗▄▄▞▘     ▝▚▄▄▖  ▟██████████▙
 ▜██████████▛  /// ▟▘ ▄ ▝▙ /// ▟███████████▛
       ▟███▛ ▟▙    ▜▄▟▀▙▄▛    ▟███▛
      ▟███▛ ▟██▙             ▟███▛      ▄
     ▟███▛  ▜███▙           ▝▀▀▀▀  ▗▄▛▀▀
     ▜██▛  ▗▌▜███▙ ▜██████████████████▛
      ▜▛  ▗▛ ▟████▙ ▜████████████████▛
          ▝▌▟██████▙     ▄▄▜███▙
           ▟███▛▜███▙▄▄▟▀▘  ▜███▙
          ▟███▛▄▄▜███▙       ▜███▙
          ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘
  '';
  
  # aliaz for all fetch tools
  programs.fish.shellAliases = {
    hyowofetch = "hyfetch --ascii-file ~/.config/hyfetch/nixowos.txt";
    neowofetch = "fastfetch --logo-type file --logo ~/.config/hyfetch/nixowos.txt";
    fastowofetch = "fastfetch --logo-type file --logo ~/.config/hyfetch/nixowos.txt";
  };
  
  programs.bash.shellAliases = {
    hyowofetch = "hyfetch --ascii-file ~/.config/hyfetch/nixowos.txt";
    neowofetch = "fastfetch --logo-type file --logo ~/.config/hyfetch/nixowos.txt";
    fastowofetch = "fastfetch --logo-type file --logo ~/.config/hyfetch/nixowos.txt";
  };
}
