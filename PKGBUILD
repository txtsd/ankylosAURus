# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%%-bin}
pkgver=0.12.0
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
backup=(etc/conf.d/spoofdpi)
options=('!debug')
source=("${__pkgname}.conf.d"
        "${__pkgname}.service")
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-amd64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-arm64.tar.gz")
sha256sums=('6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            '2e07c009e36618ea7a005dc8b576a6c4d2e1d43cbd257803bae242a4cb785020')
sha256sums_x86_64=('252dd379407bb1c853612e76697d2a092dbba45b1371432ed3d44c98ae07bd31')
sha256sums_armv7h=('f2492d75ff5d5e5d59ed9014b44d9748ba6c8836977d5b604a86d9ee37c5467b')
sha256sums_aarch64=('74d4d095de085e7e1cb17e1f7294e3727373765a519bfbd85b4a01d5a8eaee91')


package() {
    cd "${srcdir}"
    install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
    install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}

