
{
  disko.devices = {
    disk.nvme0n1 = {
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
                format = "vfat";
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
              size = "128G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };

            home = {
              size = "100%";
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
}
