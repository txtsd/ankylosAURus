# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=opennox-git
_pkgname=${pkgname%%-git}
pkgver=1.9.0.alpha13.r103.gabbdebbf4
pkgrel=1
pkgdesc='A modern implementation of the Nox game engine'
arch=('x86_64')
url='https://github.com/noxworld-dev/opennox'
license=('GPL-3.0-or-later')
depends=(
  'lib32-sdl2'
  'lib32-libglvnd'
  'lib32-glibc'
  'lib32-openal'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'go'
  'gcc-multilib'
  'lib32-sdl_image'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}/src"
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  # Fails to build without this
  export CGO_CFLAGS+=" -Wno-format-security"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/go"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go run ./internal/noxbuild -o build
}

package() {
  cd "${_pkgname}/src/build"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-hd" "${pkgdir}/usr/bin/${_pkgname}-hd"
  install -Dm755 "${_pkgname}-server" "${pkgdir}/usr/bin/${_pkgname}-server"
  local fqpn="io.github.noxworld_dev.OpenNox"
  install -Dm644 "${srcdir}/${_pkgname}/app/${fqpn}.desktop" "${pkgdir}/usr/share/applications/${fqpn}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/app/${fqpn}.HD.desktop" "${pkgdir}/usr/share/applications/${fqpn}.HD.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/app/${fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${fqpn}.metainfo.xml"
  install -Dm644 "${srcdir}/${_pkgname}/res/${_pkgname}_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${fqpn}.png"
  install -Dm644 "${srcdir}/${_pkgname}/res/${_pkgname}_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${fqpn}.png"
}

