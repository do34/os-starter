# set up git user
git config --global user.name "D. Orlowski"
git config --global user.email "do34spm@gmail.com"

# install pi
curl -fsSL https://pi.dev/install.sh | sh

# nerd font
# 1. Create the user font directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# 2. Download and extract the latest JetBrains Mono Nerd Font
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz | tar --extract --xz --directory ~/.local/share/fonts

# 3. Refresh the system font cache
fc-cache -fv


# Enable Copr repository for yazi                                            
sudo dnf copr enable lihaohong/yazi                                          
                                                                              
# Install yazi                                                               
sudo dnf install yazi -y                                                       
                                                                                
# Install lazygit                                                            
sudo dnf copr enable dejan/lazygit
sudo dnf install lazygit -y                                                     
                                                                                
# Install neovim (required for LazyVim)                                      
sudo dnf install neovim -y             


mkdir -p ~/.config/yazi                                                                                                                                                                                      
touch ~/.config/yazi/yazi.toml

# Install Brave Browser
# 1. Install the dnf plugins core (if not already present)
sudo dnf install -y dnf-plugins-core

# 2. Add the Brave repository
sudo tee /etc/yum.repos.d/brave-browser.repo << 'EOF'
[brave-browser]
name=Brave Browser
baseurl=https://brave-browser-rpm-release.s3.brave.com/x86_64/
enabled=1
gpgcheck=1
gpgkey=https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
EOF

# 3. Import the Brave signing key
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# 4. Install Brave Browser
sudo dnf install -y brave-browser