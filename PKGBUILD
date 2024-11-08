# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: nissen22 <bernhardnorneslotsberg at gmail dot com>

pkgname=ripcord-arch-libs
pkgver=0.4.29
pkgrel=3
pkgdesc='Qt-based Discord and Slack client. Modified to run on system libraries for Wayland support.'
arch=(x86_64)
url='https://cancel.fm/ripcord/'
license=('LicenseRef-ripcord')
depends=(
  gcc-libs
  glibc
  libgl
  libsodium
  libx11
  libxss
  opus
  qt5-base
  qt5-imageformats
  qt5-multimedia
  qt5-svg
  qt5-websockets
  zlib
)
provides=(ripcord)
conflicts=(ripcord)
options=(!strip)
_file="Ripcord-${pkgver}-x86_64.AppImage"
source=(
  "https://cancel.fm/dl/${_file}"{,.asc}
  LICENSE
)
sha256sums=('e320cb3c4043b0f296b4bc1da664b29776f95c2c0b02bdbf115b4d46b1669899'
            'SKIP'
            'd7b2d483acceaebebfa068223efd8fb5e0f5d66f642fa234484ca50974c9fa2c')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

prepare() {
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &> /dev/null
}

package() {
  # Directories
  rm squashfs-root/lib/*
  ln -s /usr/lib/libsodium.so squashfs-root/lib/libsodium.so.18
  rm -rf squashfs-root/plugins
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/lib/ripcord/"
  install -dm755 "${pkgdir}/usr/share/applications/"
  install -dm755 "${pkgdir}/usr/share/icons/"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  # Icon
  install -Dm644 squashfs-root/Ripcord_Icon.png "${pkgdir}/usr/share/icons/"

  # .desktop file
  sed -i 's/Exec=Ripcord/Exec=env\ QT_QPA_PLATFORM_PLUGIN_PATH=\/usr\/lib\/qt\/plugins\ ripcord/g' squashfs-root/Ripcord.desktop
  install -Dm644 squashfs-root/Ripcord.desktop -t "${pkgdir}"/usr/share/applications

  # License
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Application
  chmod 755 -R squashfs-root
  mv squashfs-root/* "${pkgdir}/usr/lib/ripcord/"
  ln -s /usr/lib/ripcord/Ripcord "${pkgdir}/usr/bin/ripcord"
}
