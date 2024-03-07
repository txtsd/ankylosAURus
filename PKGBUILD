# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langsmith
pkgver=0.1.19
pkgrel=5
pkgdesc='LangSmith Client SDK Implementations'
arch=('any')
url="https://pypi.org/project/langsmith"
license=('MIT')
_module=${pkgname#python-}
_src_name="${_module/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_module::1}/${_module}/${_src_name}.tar.gz"
        "https://github.com/langchain-ai/${_module}-sdk/raw/v${pkgver}/LICENSE")
sha256sums=('461093c19d5eb9b108069381c7342ba2fa30d60d77e5361e2374b779fa401b8b'
            '34e0b9842c7a31d34e53bc7eb224e81e07a34996106e029bbc72dea2d449f496')
depends=(python python-pydantic python-requests python-openai python-orjson
    python-pandas python-psutil python-typing_extensions python-urllib3)
makedepends=(python-build python-installer python-wheel python-poetry-core)

build() {
    cd "${_src_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
