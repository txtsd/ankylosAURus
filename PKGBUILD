# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Miika Hänninen <miika.hanninen@gmail.com>

pkgname=vimv-git
pkgver=r55.90bf552
pkgrel=1
pkgdesc='Batch-rename files using Vim'
arch=(any)
url='https://github.com/thameera/vimv'
license=('MIT')
depends=(bash)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/thameera/vimv.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm755 vimv "$pkgdir/usr/bin/vimv"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
