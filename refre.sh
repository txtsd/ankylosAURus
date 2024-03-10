repos=(
    archosaur
    archosaur-bin
    archosaur-git
    blockbench
    blockbench-bin
    blockbench-git
    blockify-git
    dissent
    dissent-bin
    dissent-git
    espanso-git
    eza-git
    fast-discord-git
    flaresolverr
    flaresolverr-bin
    gpt-engineer
    illarion-bin
    imgbrd-grabber-appimage
    java-openjdk-wakefield
    linux-command-gpt
    linux-command-gpt-git
    openssh-askpass
    otf-monocraft
    otf-unifont
    packwiz-git
    prismlauncher
    prismlauncher-bin
    prismlauncher-git
    prismlauncher-qt5
    prismlauncher-qt5-bin
    prismlauncher-qt5-git
    progress-quest-bin
    python-baycomp
    python-langchain
    python-langchain-community
    python-langchain-core
    python-langchain-text-splitters
    python-langsmith
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
    stevenarella-git
    thesage
    trelby
    trelby-git
    ttf-unifont
    vimv-git
    yt-spammer-purge
    zaread-git
)

for repo in "${repos[@]}"; do
    echo ''
    echo "--> Pulling ${repo}"
    archosaur --pull "${repo}"
done

