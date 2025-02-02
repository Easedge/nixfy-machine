{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Rodney Chang";
    userEmail = "zhangrundide@gmail.com";
    # signing = {
    #   key = "0xAABBCC0123456789";
    #   signByDefault = true;
    # };
    # extraConfig = {
    #   http = {
    #     proxy = "socks5h://127.0.0.1:8080";
    #   };
    #   https = {
    #     proxy = "socks5h://127.0.0.1:8080";
    #   };
    # };
  };
}
