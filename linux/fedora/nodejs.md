 ```bash                                                                                                                                                                                                            
   # Install required dependencies for adding repositories                                                                                                                                                          
   sudo dnf install -y dnf-plugins-core                                                                                                                                                                             
                                                                                                                                                                                                                    
   # Add the NodeSource LTS repository and install Node.js                                                                                                                                                          
   curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -                                                                                                                                                  
   sudo dnf install -y nodejs                                                                                                                                                                                       

  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc 
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null\n
  dnf check-update 
  sudo dnf install code -y

 ```     
