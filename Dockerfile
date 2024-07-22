# Use an appropriate base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openvpn qbittorrent-nox && \
    apt-get clean

# Copy Surfshark configuration files (ensure you have your Surfshark .ovpn files ready)
COPY /home/home-server/surfshark-qbittorrent/config/vpn  /etc/openvpn


# Add script to run VPN and qBittorrent
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose qBittorrent web UI port
EXPOSE 8080

# Set environment variables for VPN configuration
ENV VPN_USERNAME your_username
ENV VPN_PASSWORD your_password
ENV VPN_SERVER vpn_server_address

# Run the start script
CMD ["/start.sh"]

