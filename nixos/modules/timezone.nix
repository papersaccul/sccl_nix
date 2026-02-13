{ config, lib, pkgs, ... }:

{
  time.timeZone = "Europe/Moscow";
  
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
    };
  };
}
