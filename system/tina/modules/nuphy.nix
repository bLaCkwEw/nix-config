{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.udev.extraRules = ''
    # NuPhy Node75 LP -> 1030
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="19f5", ATTR{idProduct}=="1030", MODE="0666"
    KERNEL=="hidraw*", ATTRS{idVendor}=="19f5", ATTRS{idProduct}=="1030", MODE="0666"

    # NuPhy Node75 LP Upgrader -> 0730
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="19f5", ATTR{idProduct}=="0730", MODE="0666"
    KERNEL=="hidraw*", ATTRS{idVendor}=="19f5", ATTRS{idProduct}=="0730", MODE="0666"
  '';
}
