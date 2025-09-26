{
  # WiFi drivers for Broadcom BCM43228
  hardware.enableRedistributableFirmware = true;
  
  # Enable Broadcom WiFi drivers
  # boot.kernelModules = [ "b43" "bcma" ];
  
  # Alternative: Use broadcom-sta driver (proprietary but often more stable)
  boot.kernelModules = [ "wl" ];
  
  # Blacklist conflicting drivers
  boot.blacklistedKernelModules = [ 
    "ssb" 
    "bcm43xx" 
    "b43legacy"
    "bcma-pci-bridge"
  ];
  
  # Enable additional WiFi firmware
  hardware.firmware = with pkgs; [
    firmwareLinuxNonfree
    broadcom-bt-firmware
  ];

  # Alternative approach: Use broadcom-sta (wl) driver
  # Uncomment if b43 doesn't work well
  boot.extraModulePackages = with config.boot.kernelPackages; [
    broadcom_sta
  ];
  boot.blacklistedKernelModules = [ "b43" "bcma" ];
}