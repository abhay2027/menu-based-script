# Menu-Based Media Player Script

A simple shell script to list and play music or video files from a directory, with optional subtitle support.

## Features

- Lists all media files (`.mp3`, `.mp4`, `.mkv`) in a specified directory.
- Presents a numbered menu to choose a file for playback.
- Automatically detects and loads matching `.srt` subtitle files for videos.
- Uses `mplayer` as the default player (you can adjust it).

# Requirments
Ensure mplayer is installed on your system:

- On Arch Linux
  ```bash 
  sudo pacman -S mplayer

- On Debian/Ubuntu
   ```bash
   sudo apt update && sudo apt install mplayer

- On Fedora
  ```bash
  sudo dnf install mplayer
  
## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/abhay2027/menu‐based‐script.git 
 
2. Change into the project directory:
   ```bash
   cd menu-based-script

3. Make the script executable:
   ```bash
   chmod +x player.sh

4. Run the script:
   ```bash
   ./player.sh
