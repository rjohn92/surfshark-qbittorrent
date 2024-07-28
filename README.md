# surfshark-qbittorrent

This project sets up qBittorrent with Surfshark VPN using Docker. Follow these steps to configure and run the project.

## Prerequisites

Before you begin, make sure you have Docker installed on your system. You can download and install Docker from [here](https://docs.docker.com/get-docker/). 

Next make sure you have an OVPN subscription to a VPN provider. [Here](https://www.security.org/vpn/best/) you can choose from any reputable source. After you do that you have to get your credentials (these are different from your email/password credentials). You can find instructions on getting your credentials [here](https://support.surfshark.com/hc/en-us/articles/4403182690706-How-to-set-up-OpenVPN-on-Portal-router).

## Steps to Set Up the Project

### 1. Clone the Repository
First, clone this repository to your local machine. Open a terminal and run:

```sh
git clone https://github.com/rjohn92/surfshark-qbittorrent.git
```

Alternatively, you can download the repository as a ZIP file from GitHub and extract it to your desired location.

### 2. Pick a VPN Configuration File
Navigate to the `config/vpn` folder and pick a VPN configuration file. These files are named according to the available Surfshark servers (e.g., `us-nyc.prod.surfshark.com_udp.ovpn`).

### 3. Create a `.env` File
Navigate to the project directory. You need to create a `.env` file with your Surfshark credentials and configuration. You can do this using any text editor.

Create a file named `.env` and add the following content:


### 3. Pick a VPN Configuration File
Navigate to the `config/vpn` folder and pick a VPN configuration file. These files are named according to the available Surfshark servers (e.g., us-nyc.prod.surfshark.com_udp.ovpn).

### 4. Create a `.env` File
Navigate to the project directory. You need to create a .env file with your Surfshark credentials and configuration. You can do this using any text editor.

Create a file named .env and add the following content:

```sh
OPENVPN_CONFIG=us-nyc.prod.surfshark.com_udp
OPENVPN_PROVIDER=SURFSHARK
OPENVPN_USERNAME=Your_Surfshark_Username
OPENVPN_PASSWORD=Your_Surfshark_Password
TZ=America/New_York
```
Replace `OPENVPN_CONFIG` with the name of the VPN configuration file you picked from the `config/vpn` folder (excluding the .ovpn extension). Replace `OPENVPN_USERNAME` and `OPENVPN_PASSWORD` with your actual Surfshark credentials. You can get these credentials by following the instructions here.


### 5. Run the container
Navigate to the project directory. Run this command to start the container:

```sh
./start.sh
```

This will run your web ui. You should then go to to:

***http://localhost:8080/*** 

However, you will still need to enter a username and password. Qbittorrent UI resets this everytime the container is ran/stopped. This is annoying. I don't know how to fix it. To get your randomly generated session credentials run:

```sh
docker logs qbittorrent 2>&1 | grep "this session: " | awk -F': ' '{print $2}'
```

The user will always be: `admin`
Enter these credentials and now you will see the torrents page. 

### 6. Download Torrents
-  Go to a site that has magnet torrents (recommended [1337x.to](https://1337x.to) as of July 2024).
- Search for a torrent and click on the selected torrent with a decent number of seeders.
- Right-click and copy the magnet download link.
- In the qBittorrent web UI, select the `File` dropdown menu.
- Click the `Add Torrent Link` option.
- In the blank dialog box, paste your magnet download link.
- Scroll to the bottom and click `Download`.

