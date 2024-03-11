wget https://desktop.docker.com/mac/main/arm64/Docker.dmg
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker

### Move Docker.dmg to the recycle bin
# brew install trash
# trash Docker.dmg
### Empty the trash
# trash -e 

### Uninstall Docker
# /Applications/Docker.app/Contents/MacOS/uninstall
# trash /Applications/Docker.app
