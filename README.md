# Photoshop CC 2021 on Linux!

![alt text](https://github.com/YoungFellow-le/Photoshop-CC2021-Linux/blob/main/screenshot.png?raw=false)

**DISCLAIMER :**
**Please use this software only if you have an active Photoshop subscription. I'm not responsible of any use without subscription.**

I forked this repo and adjusted the script to keep the files that are downloaded, so that they don't have to be re-downloaded every time you want to reinstall.

Also, installing `vdk3d proton` gave me some problems with my GPU, so I made it optional.

## Requirements
- an internet connection
- wine >=6.1 (Avoid 6.20 to 6.22)
- appmenu-gtk-module
- tar
- wget
- All R/W rights on your home folder and the installer folder
- Vulkan capable GPU or APU (optional)


## How to install:

```bash
# Clone repo

git clone https://github.com/YoungFellow-le/Linux-PhotoshopCC-v22.git
cd Photoshop-CC2021-Linux

# To install:

sh installer.sh

# To uninstall:

sh uninstaller.sh
```
## Configure Photoshop:
<br>

**1-** Launch Photoshop and go to: `Edit -> preferences -> tools`, and uncheck "_Show Tooltips_" (You will not be able to use any plugins otherwise).<br>
<br>

**2-** **ONLY IF YOU INSTALLED VKD3D PROTON**:  Go to: `Edit -> preferences -> Camera raw... -> performance` and set "_Use graphic processor_" to "_Off_"
