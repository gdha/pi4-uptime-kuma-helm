# Build the pi4-uptime-kuma container image
### Be aware that GitHub build via Action the container automatically and push it to ghcr.io
### => that is uptime-kuma for x86 platform.

### As we want it for arm64 we need to build it ourselves with the following command:
### To build with a new version: ./build.sh v1.0.5
### 10/Jul/2023 - last one build was v1.0.5 (always increment nr)
REL=${1:-v1.0}
cat ~/.ghcr-token | docker login ghcr.io -u gdha --password-stdin
echo "Building pi4-uptime-kuma:$REL"
docker build --tag ghcr.io/gdha/pi4-uptime-kuma:$REL .
docker tag ghcr.io/gdha/pi4-uptime-kuma:$REL ghcr.io/gdha/pi4-uptime-kuma:latest
echo "Pushing pi4-uptime-kuma:$REL to GitHub Docker Container registry"
docker push ghcr.io/gdha/pi4-uptime-kuma:$REL
