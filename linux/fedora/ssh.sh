 # 1. Install the OpenSSH server package (if not already installed)                                                                                                                                               
   sudo dnf install -y openssh-server                                                                                                                                                                               
                                                                                                                                                                                                                    
   # 2. Start the SSH service                                                                                                                                                                                       
   sudo systemctl start sshd                                                                                                                                                                                        
                                                                                                                                                                                                                    
   # 3. Enable the SSH service to start automatically on boot                                                                                                                                                       
   sudo systemctl enable sshd                                                                                                                                                                                       
                                                                                                                                                                                                                    
   # 4. (Optional but recommended) Adjust the firewall to allow SSH traffic                                                                                                                                         
   #    If you're using firewalld (the default on Fedora):                                                                                                                                                          
   sudo firewall-cmd --permanent --add-service=ssh                                                                                                                                                                  
   sudo firewall-cmd --reload                                                                                                                                                                                       
                                                                                                                                                                                                                    
   # 5. Verify that the SSH daemon is running and listening on port 22                                                                                                                                              
   sudo systemctl status sshd                                                                                                                                                                                       
   # You can also check with:                                                                                                                                                                                       
   sudo ss -tlnp | grep :22                                  



