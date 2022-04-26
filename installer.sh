#!/bin/bash
echo -e  "**************\nStarting PS installer..."
sleep 1

cameraraw=1
echo -e  "**************\nWould you like to install Adobe Camera Raw at the end?"
echo -n  "(1 - Yes, 0 - No): "; read -p cameraraw
sleep 1

vdk3d=1
echo -e  "**************\nWould you like to install vdk3d proton?"
echo -n  "(1 - Yes, 0 - No): "; read -p vdk3d
sleep 1

echo "**************\nMaking PS prefix..."
sleep 1
mkdir $PWD/PS-Prefix/
sleep 1

echo -e  "**************\nDownloading winetricks and making executable if not already so..."
sleep 1
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
rm -rf winetricks
chmod +x winetricks
sleep 1

echo -e  "**************\nDownloading Photoshop, CameraRaw, and allredist files if not already downloaded..."
sleep 1
wget -nc "https://drive.google.com/uc?export=download&id=1qcmyHzWerZ39OhW0y4VQ-hOy7639bJPO" -o allredist.tar.xz
wget -nc "https://lulucloud.mywire.org/FileHosting/GithubProjects/AdobePhotoshop2021.tar.xz"
wget -nc "https://download.adobe.com/pub/adobe/photoshop/cameraraw/win/12.x/CameraRaw_12_2_1.exe"
rm -fr allredist
rm -fr "Adobe Photoshop 2021"
tar -xf AdobePhotoshop2021.tar.xz
mkdir allredist
tar -xf allredist.tar.xz
sleep 1


echo "**************\nBooting & creating new prefix"
sleep 1
WINEPREFIX=$PWD/PS-Prefix/ wineboot
sleep 1

echo -e  "**************\nSetting win version to win10"
sleep 1
WINEPREFIX=$PWD/PS-Prefix/ ./winetricks win10
sleep 1

echo -e  "**************\nInstalling & configuring winetricks components..."
WINEPREFIX=$PWD/PS-Prefix/ ./winetricks fontsmooth=rgb gdiplus msxml3 msxml6 atmlib corefonts dxvk
sleep 1

echo -e  "**************\nInstalling redist components..."
sleep 1
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2010/vcredist_x64.exe /q /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2010/vcredist_x86.exe /q /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2012/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2012/vcredist_x64.exe /install /quiet /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2013/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2013/vcredist_x64.exe /install /quiet /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2019/VC_redist.x64.exe /install /quiet /norestart
WINEPREFIX=$PWD/PS-Prefix/ wine allredist/redist/2019/VC_redist.x86.exe /install /quiet /norestart
sleep 1


if [ $vdk3d = "1" ]
then
echo "**************\nInstalling vdk3d proton..."
sleep 1
WINEPREFIX=$PWD/PS-Prefix/ sh allredist/setup_vkd3d_proton.sh install
sleep 1
fi

echo -e  "**************\nMaking PS directory and copying files..."
sleep 1
mkdir $PWD/PS-Prefix/drive_c/Program\ Files/Adobe
cp -r Adobe\ Photoshop\ 2021 $PWD/PS-Prefix/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021
sleep 1

echo -e  "**************\nCopying launcher files..."
sleep 1
cp -r allredist/launcher.sh ~/Software/ADOBE/My-PS/PS-Prefix/drive_c
cp -r allredist/photoshop.png ~/.local/share/icons
echo -e "[Desktop Entry]\nName=Photoshop CC\nExec=WINEPREFIX=\"$PWD/PS-prefix wine64 $PWD/PS-prefix/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021/photoshop.exe\"\nType=Application\nComment=Photoshop CC 2021\nCategories=Graphics;2DGraphics;RasterGraphics;GTK;\nIcon=$PWD/allredist/photoshop.png\nStartupWMClass=photoshop.exe" >> allredist/photoshop.desktop
chmod +x photoshop.desktop
mv photoshop.desktop ~/.local/share/applications/photoshop.desktop
rm -rf allredist
sleep 1

if [ $cameraraw = "1" ]
then
echo "**************\Installing Adobe Camera Raw..."
sleep 1
WINEPREFIX=$PWD/PS-Prefix/ wine CameraRaw_12_2_1.exe
sleep 1
fi

echo -e  "**************\nAdobe Photoshop CC 2021 Installed!"
