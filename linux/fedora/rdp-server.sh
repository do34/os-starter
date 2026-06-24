   # Install xrdp package                                                       
   sudo dnf install -y xrdp                                                     
                                                                                
   # Enable and start the xrdp service                                          
   sudo systemctl enable --now xrdp                                             
                                                                                
   # Configure firewall (firewalld is default on Fedora) to allow RDP port      
   sudo firewall-cmd --add-port=3389/tcp --permanent                            
   sudo firewall-cmd --reload                                                   
                                                                                
   # Optional but recommended: add your user to ssl-cert group for proper xrdp  functionality                                                                  
   sudo usermod -aG ssl-cert $USER                                              
   # Then log out and back in, or restart xrdp:                                 
   sudo systemctl restart xrdp
