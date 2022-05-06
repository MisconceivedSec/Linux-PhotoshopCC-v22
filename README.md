# Photoshop CC 2021 on Linux!

![Screenshot](https://github.com/YoungFellow-le/Linux-PhotoshopCC-v22/blob/main/Images/screenshot.png?raw=false)

**DISCLAIMER :**
**Please use this software only if you have an active Photoshop subscription. I'm not responsible for any illegal use of this product.**

I forked this repo and adjusted the script to keep the files that are downloaded, so that they don't have to be re-downloaded every time you want to reinstall.

Also, installing `vdk3d proton` gave me some problems with my GPU, so I made it optional.

## Requirements
- An internet connection
- wine >=6.1 (Avoid 6.20 to 6.22)
- appmenu-gtk-module
- tar
- wget
- curl
- All R/W rights on your home folder and the installer folder
- Vulkan capable GPU or APU (optional)


## How to install:

>_**NOTE:** The total download size, is about 1.6GB_

>_**NOTE 2:** CLONE THIS REPO TO THE FOLDER YOU WANT TO KEEP PHOTOSHOP IN, EVERYTHING TO DO WITH THE PHTOTOSHOP INSTALLATION WILL HAPPEN IN HERE_

>_**NOTE 3:** THE ONLY FILE THAT WILL BE INSTALLED OUTSIDE THE CLONED FOLDER IS THE DESKTOP ENTRY: ~/.local/share/applications/photoshop.desktop_

Open your terminal and:

```bash
# Clone the repo

git clone https://github.com/YoungFellow-le/Linux-PhotoshopCC-v22.git
cd Linux-PhotoshopCC-v22

# To install:

bash installer.sh

# The installer will ask you if you want to install the Adobe Camera Raw Plugin (that is yes in most cases)
# If you don't want to install it the enter '0', otherwise enter '1' e.g.

"Would you like to install Adobe Camera Raw at the end?
(1 - Yes, 0 - No): 1"

# The installer will also ask you weather you want to install vdk3d proton,
# this utility allows you to use your GPU with wine.

"Would you like to install vdk3d proton?
(1 - Yes, 0 - No): 0"

# However, it can be a bit buggy. There for it's up to you weather to install it or not, e.g.
# You can always install it afterwards by running the following command in the "Linux-PhotoshopCC-v22" folder:

WINEPREFIX=$PWD/PS-Prefix/ sh Installers/allredist/setup_vkd3d_proton.sh install

# And to uninstall:

WINEPREFIX=$PWD/PS-Prefix/ sh Installers/allredist/setup_vkd3d_proton.sh uninstall


# To uninstall Photoshop:

bash uninstaller.sh

# If you want to completely remove this installer, then delete the cloned folder after running the uninstaller.
```
## Configure Photoshop:
<br>

**1-** Launch Photoshop and go to: `Edit -> preferences -> tools`, and uncheck "_Show Tooltips_" (You will not be able to use any plugins otherwise).<br>
<br>

**2-** **ONLY IF YOU INSTALLED VKD3D PROTON**:  Go to: `Edit -> preferences -> Camera raw... -> performance` and set "_Use graphic processor_" to "_Off_"

## To change the wine theme to light Windows 10:
  ```bash
  # Navigate to the Photoshop clone folder e.g.
  
  cd ~/Documents/Linux-PhotoshopCC-v22
  
  # Open winecfg
  
  WINEPREFIX=$PWD/PS-Prefix winecfg
  
  # Now navigate to the "Desktop integration" tab and change the theme to "Light"
  
  ```
## How to run Photoshop:

After you run the installer, open your application menu, and search for "Photoshop CC", and click on it. As simple as that!

![Screenshot_20220427_103958](https://user-images.githubusercontent.com/79008923/165448708-b6ce4ac1-8f55-4f48-968d-9608c765a318.png)

>_**NOTE:** If you do not find the desktop entry, or if it doesn't work, then run the command that is in the `launcher.sh` file. This command should launch Photoshop for you, or it will at least tell you what the error is. (This command is also printed at the end of the installation)_



