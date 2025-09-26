{
  # Increase system limits to prevent "too many open files" errors
  systemd.user.extraConfig = ''
    DefaultLimitNOFILE=65536
    DefaultLimitNPROC=32768
  '';

  systemd.extraConfig = ''
    DefaultLimitNOFILE=65536
    DefaultLimitNPROC=32768
  '';

  # Security limits
  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "65536";
    }
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "65536";
    }
    {
      domain = "*";
      type = "soft";
      item = "nproc";
      value = "32768";
    }
    {
      domain = "*";
      type = "hard";
      item = "nproc";
      value = "32768";
    }
  ];
}