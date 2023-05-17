#!/bin/bash
sudo apt-get update && apt-get install -y hugo make
sudo apt-get install curl -y
sudo curl -Lo install_hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb
sudo apt-get install ./install_hugo.deb
sudo npm install -g markdownlint-cli
sudo apt update
sudo go install github.com/golangci/golangci-lint/cmd/[email protected]`
sudo apt install golang