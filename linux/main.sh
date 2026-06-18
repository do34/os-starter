# set up git user
git config --global user.name "D. Orlowski"
git config --global user.email "do34spm@gmail.com"

# install pi
curl -fsSL https://pi.dev/install.sh | sh

# Enable Copr repository for yazi                                            
sudo dnf copr enable lihaohong/yazi                                          
                                                                              
# Install yazi                                                               
sudo dnf install yazi -y                                                       
                                                                                
# Install lazygit                                                            
sudo dnf copr enable dejan/lazygit
sudo dnf install lazygit -y                                                     
                                                                                
# Install neovim (required for LazyVim)                                      
sudo dnf install neovim -y             
