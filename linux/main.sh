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
