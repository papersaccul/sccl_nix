{ config, lib, pkgs, ... }:

{
  services.xserver.xkb = {
    layout = "colemak_caws,rulemak_caws";
    options = "caps:backspace,grp:win_space_toggle,lv3:ralt_alt";
    
    extraLayouts = {
      colemak_caws = {
        description = "Colemak-CAWS";
        languages = [ "eng" ];
        symbolsFile = pkgs.writeText "colemak_caws" ''
          default partial alphanumeric_keys
          xkb_symbols "basic" {
            name[Group1]= "Colemak-CAWS";
            
            include "us(basic)"
            
            key <AE07> { [ backslash, bar ] };
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
      };
      
      rulemak_caws = {
        description = "Rulemak-CAWS";
        languages = [ "rus" ];
        symbolsFile = pkgs.writeText "rulemak_caws" ''
          default partial alphanumeric_keys
          xkb_symbols "basic" {
            name[Group1]= "Rulemak-CAWS";
            
            key <TLDE> { [ Cyrillic_io, Cyrillic_IO ] };
            key <AE01> { [ 1, exclam ] };
            key <AE02> { [ 2, quotedbl ] };
            key <AE03> { [ 3, numerosign ] };
            key <AE04> { [ 4, semicolon ] };
            key <AE05> { [ 5, percent ] };
            key <AE06> { [ 6, colon ] };
            key <AE07> { [ Cyrillic_e, Cyrillic_E ] };
            key <AE08> { [ 7, question ] };
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
            key <AD12> { [ Cyrillic_yu, Cyrillic_YU ] };
            
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
            key <AB09> { [ comma, less ] };
            key <AB10> { [ period, greater ] };
            
            key <BKSL> { [ backslash, bar ] };
            key <SPCE> { [ space ] };
          };
        '';
      };
    };
  };
  
  console.useXkbConfig = true;
}
