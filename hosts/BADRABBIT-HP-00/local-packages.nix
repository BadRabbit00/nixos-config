{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    gcc
    kdenlive
    # jetbrains.pycharm-professional
    jdk23  # Modern Java Development Kit
    # qemu
    # quickemu
  ];
}
