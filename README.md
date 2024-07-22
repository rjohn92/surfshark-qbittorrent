# surfshark-qbittorrent

This project sets up qBittorrent with Surfshark VPN using Docker. Follow these steps to configure and run the project.

## Prerequisites

Before you begin, make sure you have Docker installed on your system. You can download and install Docker from [here](https://docs.docker.com/get-docker/).

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
Navigate to the config/vpn folder and pick a VPN configuration file. These files are named according to the available Surfshark servers (e.g., us-nyc.prod.surfshark.com_udp.ovpn).

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
Replace OPENVPN_CONFIG with the name of the VPN configuration file you picked from the config/vpn folder (excluding the .ovpn extension). Replace Your_Surfshark_Username and Your_Surfshark_Password with your actual Surfshark credentials. You can get these credentials by following the instructions here.


### 5. Run the container
Navigate to the project directory. Run this command to start the container:

```sh
./start.sh
```

This will run your web ui. You should then go to to:

***http://localhost:8080/*** 

However, you will still need to enter a username and password. Qbittorrent UI resets this everytime the container is run/stopped. This is annoying. I don't know how to fix it. To get your randomly generated session credentials run:

```sh
docker logs qbittorrent 2>&1 | grep "this session: " | awk -F': ' '{print $2}'

```

THe user will always be: ***admin***
