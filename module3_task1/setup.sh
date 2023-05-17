#!/bin/bash
sudo apt-get update && apt upgrade -y
sudo apt-get install -y hugo make
sudo apt-get install curl -y
sudo curl -Lo install_hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb
sudo wget https://github.com/golangci/golangci-lint/releases/download/v1.52.2/golangci-lint-1.52.2-darwin-amd64.tar.gz
sudo apt install golang
sudo go install github.com/gohugoio/hugo@latest
sudo apt-get install ./install_hugo.deb
sudo npm install -g markdownlint-cli
sudo make build