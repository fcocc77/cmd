
# dependencias de rofi
depencences=(
	cairo-devel 
	pango-devel 
	libxkbcommon-devel 
	gdk-pixbuf2-devel 
	xcb-util-devel
	meson
	libev-devel
	libxkbcommon-x11-devel
	xcb-util-wm-devel
	startup-notification-devel
	https://pkgs.dyn.su/el8/base/x86_64/xcb-util-xrm-devel-1.3-5.el8.x86_64.rpm
)

sudo yum -y install ${depencences[@]}


cd /tmp
git clone https://github.com/davatorium/rofi.git
cd /tmp/rofi
git submodule update --init


source /opt/rh/devtoolset-9/enable
meson --buildtype=release . build
ninja -C build
ninja -C build install

