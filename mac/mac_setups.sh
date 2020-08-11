# ------------------------------
# --- Mac preferences setups ---
# ------------------------------

# --- boot ---
# make no sound when you boot
sudo nvram SystemAudioVolume=" "

# --- freeze or crash ---
# automatically reboot when your Mac freezes
sudo systemsetup -setrestartfreeze on

# ignore crash report
defaults write com.apple.CrashReporter DialogType -string "none"

# --- Finder ---
# show all extensions file
defaults write -g AppleShowAllExtensions -bool true

# show path bar in Finder
defaults write com.apple.finder ShowPathBar -bool true

# show full path on the path bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# put folders first when sort with names
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# show all files including unvisible files
defaults write com.apple.finder AppleShowAllFiles YES

# disable warning when empty trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# disable opening window animation
defaults write com.apple.finder AnimateWindowZoom -bool false

# show ~/Library
chflags nohidden ~/Library

# --- Key Repeat ---
# initial key repeat starts after 15 * n [ms]
defaults write -g InitialKeyRepeat -int 10

# key repeat with interval 15 * n [ms]
defaults write -g KeyRepeat -int 1

# --- Dock ---
# Delete all application icon from dock
defaults write com.apple.dock persistent-apps -array

# Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size
defaults write com.apple.dock titlesize -int 55

# --- Menu bar ---
# show battery percentage
defaults write com.apple.menuextra.battery "YES"

# show date and time
default write com.apple.menuextra.clock "DateFormat" 'EEE MMM d  h:mm a'

# reboot menu bar
killall SystemUIServer

# --- Audio ---
# make better quality of sound for Bluetooth head set
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# --- Mouse ---
# tap to click
defaults write -g com.apple.mouse.tapBehavior -int 1

# cursor speed
defaults write -g com.apple.mouse.scaling 5

# --- Misson Control (Hot Corner) ---
# Possible values:
#  0: no operation
#  2: Misson Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  7: Dashbord
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification center

# Top left screen corner: no operation
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner: no operation
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner: start screen saver
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0

# Bottom right screen corner: no operation
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# reboot Finder and Dock
killall Finder
killall Dock

# -------------------------
# --- software installs ---
# -------------------------

# install Command Line Tools for Xcode
xcode-select --install

# install Homebrew
# TODO: check URL just in case
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap caskroom/cask
brew update

# --- brew installs without GUI ---
brew install zsh
echo "/usr/local/bin/zsh" >> /etc/shells
sudo chsh -s /usr/local/bin/zsh  # change shell to zsh
brew install git
brew install neovim
brew install tmux
brew install python3

# --- brew installs with GUI ---
brew cask install docker
brew cask install google-chrome
brew cask install iterm2
brew cask install line
brew cask install slack
brew cask install visual-studio-code
brew cask install zoomus
brew tap homebrew/cask-fonts
brew caskinstall font-fira-code

# intall TeX
brew cask install mactex
sudo tlmgr update ---self --all
sudo tlmgr paper a4

# --- pip installs ---
pip3 install numpy
pip3 install scipy
pip3 install pandas
pip3 install matplotlib
pip3 install scikit-learn
pip3 install jupyter
pip3 install seaborn
pip3 install tensorflow

read -p "All process done! Reboot your Mac? [Y/n]:" str
if [ "$srt" = "Y" ] || [ "$srt" == "y" ]; then
    echo "Reboot your Mac in 5 seconds"
    now = 0
    goal = 5
    while [[ $now -lt $goal ]]; do
        echo $(($goal - $now));
        sleep 1
        now=$((${now}+1))
    done
    echo "See you, $(whoami)!!"
    sudo reboot
else
    echo "Reboot your Mac later."
    echo "See you, $(whoami)!!"
fi

exit 0
