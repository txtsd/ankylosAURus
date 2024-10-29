# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=android_translation_layer-git
_pkgname=${pkgname%%-git}
_pkgname=${_pkgname//-/_}
pkgver=r636.2e2a3c8
pkgrel=1
pkgdesc='A translation layer for running Android apps on a Linux system'
url='https://gitlab.com/android_translation_layer/android_translation_layer'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
# libopensles-standalone is not strictly required but some Android applications depend on it
depends=(
  alsa-lib
  bionic_translation
  ffmpeg
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gtk4
  java-runtime
  libglvnd
  libgudev
  libopensles-standalone
  libportal
  pango
  skia-sharp
  sqlite
  vulkan-icd-loader
  webkitgtk-6.0
)
makedepends=(
  art_standalone
  git
  glib2-devel
  java-runtime-common
  jdk8-openjdk
  meson
  openxr
  vulkan-headers
  wayland-protocols
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  meson subprojects download --sourcedir=${_pkgname}
}

build() {
  arch-meson ${_pkgname} build
	meson compile -C build
}

check() {
	meson test --no-rebuild --print-errorlogs -C build
}

package() {
	meson install --no-rebuild -C build --destdir "${pkgdir}"
}

