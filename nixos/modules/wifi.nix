{
  # WiFi drivers for Broadcom BCM43228
  hardware.enableRedistributableFirmware = true;
  
  # Enable Broadcom WiFi drivers
  # boot.kernelModules = [ "b43" "bcma" ];
  
  # Alternative: Use broadcom-sta driver (proprietary but often more stable)
  boot.kernelModules = [ "wl" ];
  
  # Blacklist conflicting drivers (combined list)
  boot.blacklistedKernelModules = [ 
    "ssb" 
    "bcm43xx" 
    "b43legacy"
    "bcma-pci-bridge"
    "b43"
    "bcma"
  ];
  
  # Enable additional WiFi firmware
  hardware.firmware = with pkgs; [
    firmwareLinuxNonfree
    broadcom-bt-firmware
  ];

  # Use broadcom-sta (wl) driver - proprietary but stable
  boot.extraModulePackages = with config.boot.kernelPackages; [
    broadcom_sta
  ];
}