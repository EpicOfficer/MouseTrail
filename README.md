# MouseTrail

[![Publish Docker image](https://github.com/EpicOfficer/mousetrail/actions/workflows/docker-image-build.yml/badge.svg)](https://github.com/EpicOfficer/mousetrail/actions/workflows/docker-image-build.yml)

MouseTrail is a Docker container designed to keep your MyAnonymouse seedbox IP up to date by running an hourly script.

## Prerequisites

- **Docker**
- An environment variable `MAM_ID` with your MyAnonymouse session cookie string. (*Find it under User -> Preferences -> Security*)

## Quick Start

### Build the Image

To build the image locally:

```sh
docker build -t mousetrail .
```

### Run the Container

Run the container with your MyAnonymouse session cookie. Ensure it restarts automatically unless stopped:

```sh
docker run -e MAM_ID=your_mam_id --restart unless-stopped -d mousetrail
```

### Use Pre-Packaged Version

You can also use the pre-packaged version directly from GitHub Container Registry with automatic restart:

```sh
docker run -e MAM_ID=your_mam_id --restart unless-stopped -d ghcr.io/epicofficer/mousetrail:latest
```

## Check the Logs

To see if everything is running smoothly, check the container logs:

```sh
docker logs <container_id>
```

Replace `<container_id>` with the actual ID of your running container.

Enjoy hassle-free updates with MouseTrail!