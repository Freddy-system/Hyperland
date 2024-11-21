# ------------------------------------------------------
# Install tty login and issue
# ------------------------------------------------------
if [ -d ~/dotfiles ] ;then
    current_browser=$(cat ~/dotfiles/.settings/browser.sh)
    if [ ! "$current_browser" == "brave" ] ;then
        echo -e "${GREEN}"
        figlet "Browser"
        echo -e "${NONE}"
        echo ":: The current browser is $current_browser"
        if gum confirm "Do you want to install Brave instead?" ;then
            echo ":: Installing Brave..."
            _installPackagesPacman "brave-browser"
            echo ":: Setting Brave as Default browser"
            echo "brave" > ~/dotfiles/.settings/browser.sh
            echo "brave https://chat.openai.com" > ~/dotfiles/.settings/ai.sh
            xdg-settings set default-web-browser brave-browser.desktop
            echo
            gum spin --spinner dot --title "Recommended to change the browser icon to Brave in ~/dotfiles/.settings/waybar-quicklinks.json" -- sleep 5
        elif [ $? -eq 130 ]; then
            echo ":: Installation canceled."
            exit 130
        else
            echo ":: Installation of Brave skipped"
        fi
    fi
else
    echo ":: Brave will be installed as the default browser."
    _installPackagesPacman "brave-browser"
    echo ":: Setting Brave as Default browser"
    xdg-settings set default-web-browser brave-browser.desktop
fi
