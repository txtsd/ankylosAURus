repos=(
    archosaur
    archosaur-bin
    archosaur-git
    bitmagnet
    bitmagnet-bin
    blockbench
    blockbench-bin
    blockbench-git
    dissent
    dissent-bin
    dissent-git
    dpitunnel
    dpitunnel-bin
    dpitunnel-git
    espanso-git
    eza-git
    fast-discord-git
    flaresolverr
    flaresolverr-bin
    gpt-engineer
    halloy
    halloy-bin
    halloy-git
    illarion-bin
    imgbrd-grabber-appimage
    java-openjdk-wakefield
    jsoncons
    jwt-cpp
    libfm-qt-git
    linux-command-gpt
    linux-command-gpt-git
    lxqt_wallet
    lxqt_wallet-git
    makemkv
    opennox
    opennox-bin
    opennox-git
    openssh-askpass
    openssl-static
    otf-monocraft
    otf-sans-forgetica
    otf-unifont
    packwiz-git
    pcmanfm-qt-git
    porla
    prismlauncher-git
    prismlauncher-qt5
    prismlauncher-qt5-bin
    prismlauncher-qt5-git
    progress-quest-bin
    python-baycomp
    python-confusables
    python-pox
    python-pykakasi
    python-syncedlyrics
    ripcord
    ripcord-arch-libs
    ripme
    ripme-bin
    ripme-git
    soundsense
    soundsense-rs-git
    spoofdpi
    spoofdpi-bin
    spoofdpi-git
    stevenarella-git
    thesage
    trelby
    trelby-git
    ttc-monocraft
    ttf-unifont
    usockets
    uwebsockets
    vimv-git
    yt-spammer-purge
    zaread-git
)

for repo in "${repos[@]}"; do
    echo ''
    echo "--> Pushing ${repo}"
    archosaur "${repo}" --speedup || exit 1
done
