# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=openkeeper-git
_pkgname=OpenKeeper
pkgver=r2701.0923a080
pkgrel=1
pkgdesc='An open source remake of the Dungeon Keeper II game and engine.'
arch=('any')
url='https://github.com/tonihele/OpenKeeper'
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'java-runtime>=21'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'gradle'
  'java-environment>=21'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  'git+https://github.com/tonihele/OpenKeeper'
  'OpenKeeper.desktop'
)
sha256sums=('SKIP'
            '035182dfb1269e3fad55f273928ec323ed99da78c403d1e839f7b32cf15cc0b1')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
  gradle clean build
}

package() {
	cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/opt"

  bsdtar -xf "build/distributions/${_pkgname}.tar" -C "${pkgdir}/opt"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/assets/Icons/openkeeper.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  
}
