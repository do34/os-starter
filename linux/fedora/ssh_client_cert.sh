   # On macOS, display the key                                                                                                                                                                                      
   cat ~/.ssh/id_ed25519.pub                                                                                                                                                                                        
                                                                                                                                                                                                                    
   # SSH into Fedora (password login) and add the key                                                                                                                                                               
   ssh <your_fedora_user>@<fedora_ip_or_hostname>                                                                                                                                                                   
   # On the Fedora side:                                                                                                                                                                                            
   mkdir -p ~/.ssh                                                                                                                                                                                                  
   chmod 700 ~/.ssh                                                                                                                                                                                                 
   # Paste the key you copied from macOS into the next line:                                                                                                                                                        
   echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE..." >> ~/.ssh/authorized_keys                                                                                                                                       
   chmod 600 ~/.ssh/authorized_keys                                                                                                                                                                                 
   exit                             


