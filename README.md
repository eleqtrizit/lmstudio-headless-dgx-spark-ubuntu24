# LM Studio Service Manager

This repository contains scripts for installing and managing [LM Studio](https://lmstudio.ai/) as a systemd user service on Linux systems. LM Studio is downloaded and run as an AppImage with Xvfb (X Virtual Framebuffer) to provide a headless display environment.

Originally written for my DGX Spark, but works with Ubuntu 22+ and Arch-based systems.

After installation, you can control LM Studio with the [lms cli](https://lmstudio.ai/docs/cli).

+ [more lms cli docs](https://lmstudio.ai/blog/lms)
+ [lms github repo](https://github.com/lmstudio-ai/lms)

**These scripts assume this repository is downloaded to `~/lmstudio`**

## Quick Start

- From ~/, `git clone https://github.com/eleqtrizit/lmstudio-headless-dgx-spark-ubuntu24.git`
- `./first_time_install.sh` - never need to run this again.
- `./install_or_update_lmstudio.sh` - run this as new versions arrive or just starting

## Credit
This is a take on [running headless LM Studio on Ubuntu](https://run.tournament.org.il/running-headless-lm-studio-on-ubuntu/)

## Prerequisites

- Ubuntu-based Linux distribution (maybe Debian or more?)
- Systemd user services support
- Internet connection for downloading LM Studio

## Installation

1. Clone or download this repository to `~/lmstudio`
2. Run the first-time installation script:
   ```bash
   ./first_time_install.sh
   ```
3. Install or update LM Studio:
   ```bash
   ./install_or_update_lmstudio.sh
   ```

## Scripts Overview

- `first_time_install.sh`: Installs required packages (xvfb, xauth) and copies systemd service files
- `install_or_update_lmstudio.sh`: Downloads the latest LM Studio AppImage, extracts it, and sets up the service
- `start.sh`: Starts the LM Studio service
- `stop.sh`: Stops the LM Studio service
- `status.sh`: Shows the status of the LM Studio service

## Services

This setup includes two systemd user services:

1. `xvfb-user.service`: Provides a virtual X server environment (required for LM Studio)
2. `lmstudio-user.service`: Runs the LM Studio application

## Configuration

The `lmstudio.env` file contains environment variables:
- `DISPLAY`: The virtual display number (default :99)
- `LM_STUDIO`: Path to the LM Studio executable

## Important Notes


- LM Studio runs headlessly using Xvfb
- Services are managed as user services (not system-wide)
- The installation will automatically detect your system architecture (x86_64 or ARM64) and download the appropriate version

## Usage

After installation, you can control LM Studio using:
```bash
# Start LM Studio
./start.sh

# Stop LM Studio
./stop.sh

# Check status
./status.sh

# Update to latest version of LM Studio
./install_or_update_lmstudio.sh
```

## Troubleshooting

Check service status:
```bash
systemctl --user status lmstudio-user.service
systemctl --user status xvfb-user.service
```

View service logs:
```bash
journalctl --user -u lmstudio-user.service
journalctl --user -u xvfb-user.service
```
