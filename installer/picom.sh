# cmake instalacion, requerido para compilar picom
wget http://www.cmake.org/files/v3.8/cmake-3.8.2.tar.gz
tar -zxvf cmake-3.8.2.tar.gz
cd cmake-3.8.2
./bootstrap
make -j 4
sudo make install


# dependencias de picom
depencences=(
	meson
	libev-devel
	xcb-util-renderutil-devel
	xcb-util-image-devel
	uthash-devel
)

sudo yum -y install ${depencences[@]}

cd /tmp
wget https://github.com/yshui/picom/archive/v8.2.tar.gz
tar -zxvf v8.2.tar.gz
cd picom-8.2


source /opt/rh/devtoolset-7/enable
meson --buildtype=release . build
ninja -C build

ninja -C build install
