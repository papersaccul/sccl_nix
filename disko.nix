{
  disko.devices = {
    disk = {
      my-disk = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "256M";
              content = {
               type = "filesystem";
                format = "fat32";
                mountpoint = "/boot";
              };
            };

            swap = {
              size = "16G";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };

            root = {
              size = "25%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };

            home = {
              size = "100%FREE";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
              };
            };

          };
        };
      };
    };
  };
}
