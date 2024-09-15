# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-pykakasi
pkgver=2.3.0
pkgrel=2
pkgdesc="Lightweight converter from Japanese Kana-kanji sentences into Kana-Roman"
arch=(any)
url='https://codeberg.org/miurahr/pykakasi'
license=(GPL-3.0-or-later)
depends=(
    python-deprecated
    python-jaconv
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-sphinx
    python-wheel
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('8c5a168696b2493bcdba39f877c014b31006055a85b86f9e4f1b09708005017d14db2f2113409e2cc45930681133849f4c95ee7ad1aea7fff071440b50c27fbe')

build() {
  cd pykakasi
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd pykakasi
  python -m installer --destdir="$pkgdir" dist/*.whl

  # rename script in /usr/bin to pykakasi in order to avoid conflicts with the kakasi package
  mv "$pkgdir"/usr/bin/{,py}kakasi

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/_build/text/*
}
