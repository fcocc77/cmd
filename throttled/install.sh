sudo pip3 install psutil

sudo dnf copr enable abn/throttled
sudo dnf install -y throttled


sudo systemctl enable --now throttled

# Herramienta para monitorear el cpu
# usage: python3 -m s_tui.s_tui
pip3 install s-tui --user

# Service
systemd="/etc/systemd/system/throttle.service"

sudo systemctl stop throttle
sudo rm -rf '/opt/throttled'
sudo rm $systemd

sudo cp -rf ../throttled '/opt/throttled'
sudo cp '/opt/throttled/throttle.service' $systemd

sudo chmod 755 -R '/opt/throttled'

sudo systemctl enable throttle
sudo systemctl start throttle
