profileDir="c4ymyiy6.default-nightly-1719718485498"
dir="$HOME/Library/Application Support/Firefox/Profiles/$profileDir/chrome"

git -C "$dir" fetch --all && git -C "$dir" pull
