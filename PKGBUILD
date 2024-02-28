# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain
pkgver=0.1.9
pkgrel=1
pkgdesc='Build context-aware reasoning applications'
arch=('any')
url='https://github.com/langchain-ai/langchain'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/langchain-ai/langchain/archive/refs/tags/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langchain/v${pkgver}/LICENSE")
sha256sums=('f9271c24135306e42b4f730570caee5a49ce1f86f328916f6e505e4ce500c8ce'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')
depends=(python
    python-aiohttp
    python-dataclasses-json
    python-jsonpatch
    python-numpy
    python-pydantic
    python-yaml
    python-requests
    python-sqlalchemy
    python-tenacity
    python-jsonschema
    python-rapidfuzz
    python-lark-parser
    python-lxml
    python-pandas
    python-mypy_extensions
    python-regex
    python-typing_extensions
    python-async-timeout
    python-redis
    python-beautifulsoup4
    python-tiktoken
    python-openai
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')

build() {
    cd langchain-${pkgver}/libs/langchain
    python -m build --wheel --no-isolation
}

package() {
    cd langchain-${pkgver}/libs/langchain
    python -m installer --destdir="${pkgdir}" dist/*.whl
    cd ${srcdir}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
