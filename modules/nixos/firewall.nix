{




  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 8008 443 3000 996 7946 4789 2377 6002 32400 25565 ];
    allowedUDPPorts = [ 7946 4789 2377 ];

    # let coolify access sandkasten to proxy it
    extraCommands = ''
      # Allow traffic from coolify subnet to port 8088
      iptables -A INPUT -s 172.18.0.0/16 -p tcp --dport 8088 -j ACCEPT
      # Allow traffic from coolify bridge to port 8088
      iptables -A INPUT -i br-313c80aea3cb -p tcp --dport 8088 -j ACCEPT
    '';
    extraStopCommands = ''
      iptables -D INPUT -s 172.18.0.0/16 -p tcp --dport 8088 -j ACCEPT || true
      iptables -D INPUT -i br-313c80aea3cb -p tcp --dport 8088 -j ACCEPT || true
    '';

  };
}
