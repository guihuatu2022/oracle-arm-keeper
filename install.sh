#!/bin/bash
sudo cp arm-keeper.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/arm-keeper.sh
sudo tee /etc/systemd/system/arm-keeper.service <<EOL
[Unit]
Description=ARM Instance Keeper
After=network.target

[Service]
ExecStart=/usr/local/bin/arm-keeper.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOL
sudo systemctl daemon-reload
sudo systemctl enable --now arm-keeper.service
echo "保活服务已启用！"
