# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Joaquín Rufo Gutierrez <joaquinito2051@gmail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett
pkgver=0.21.1018
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('aspnet-runtime-6.0')
optdepends=(
  'flaresolverr: A proxy server to bypass Cloudflare protection'
)
makedepends=('dotnet-sdk-6.0')
options=('!strip' 'staticlibs')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/archive/v${pkgver}.tar.gz"
  'jackett.service'
  'jackett.sysusers'
  'jackett.tmpfiles'
)

sha256sums=('29c2d1fb72ee0b7818bdde883e65cfeb0c96914bc247944c424335e56d962d51'
            '9d8f9d73e5fa2b2877dde010c0d8ca6fbf47f03eb1f01b02f846026a949a0dcf'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1')

build() {
  cd ${pkgname^}-${pkgver}

  case ${CARCH} in
    x86_64)  _CARCH='x64';;
    aarch64) _CARCH='arm64';;
    armv7h)  _CARCH='arm';;
  esac

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  dotnet publish src/Jackett.Server -f net6.0 --no-self-contained -r linux-${_CARCH} -c Release -o build/ /p:AssemblyVersion=${pkgver} /p:FileVersion=${pkgver} /p:InformationalVersion=${pkgver} /p:Version=${pkgver}
  # This is required because dotnet build servers do not terminate even after the parent process does
  dotnet build-server shutdown
}

package() {
  cd ${pkgname^}-${pkgver}
  install -d -m 755 "${pkgdir}/usr/lib/jackett/"
  cp -dpr --no-preserve=ownership build/* "${pkgdir}/usr/lib/jackett/"

  install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
  install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
  install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
