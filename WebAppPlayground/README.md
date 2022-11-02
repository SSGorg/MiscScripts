# Web Application Hackers Playground
I started this project because I wanted to be lazy and have a script setup that would let me launch the two main vuln boxes for web app hacking target practice. I shared it around. People liked it enough. If this gets big enough I will just make it its own repo but for now it is okay where it is. 

## Install instructions: 
1. clone the repo:   
  `git clone https://github.com/SSGorg/MiscScripts`
2. move into the WAP folder:  
  `cd /MiscScripts/WebAppPlayground`
3. Install based on your os:   
**Right now we only have Debian and Arch supported.**  
  `./wap-deb.sh` 
4. It should be self expanitory from here.   

## You might want to add an alias to your system. 
1. Open `~/.bashrc` and or `~/.zshrc`
2. add the following command to that file (at the bottom)  
   ```alias wap='cd /path/to/ && ./wap-deb.sh' ```
3. Exit the command line and restart it. 
4. Type in `wap`
As of this point you should have access to the tool through a single command. 
