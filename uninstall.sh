#!/bin/bash
sudo systemctl stop arm-keeper.service
sudo systemctl disable arm-keeper.service
sudo rm -f /usr/local/bin/arm-keeper.sh /etc/systemd/system/arm-keeper.service
echo "保活服务已移除！"
