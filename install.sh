#!/bin/bash


main ()
{
clear
echo "================================================="
echo " This script is to install Leroy Jenkins"
echo "================================================"
echo ""
echo " This is licensed under GPLv3."
echo " If there are any questions regarding the license"
echo " please go to http://www.gnu.org/licenses/gpl.html"
echo ""
echo " Currently maintained by James Luther (CaptainHooligan)"
echo ""
echo "================================================="
echo "Press [ENTER] to continue..."
read 
echo ""
clear
WHOAMI = `id | sed -e 's/(.*//'`
if [ "$WHOAMI" != "uid=0" ] ; then
    echo "Sorry but you need to run this script as super user."
    exit 1
fi
echo ""
echo -e "Copying files ..."
mkdir /usr/share/leroy-jenkins
cp * /usr/share/leroy-jenkins/
ln -s /usr/share/leroy-jenkins/leroy-jenkins.py /usr/bin/leroy-jenkins
echo ""
read -p "Would you like to create a desktop shortcut for Leroy Jenkins? (y/n)"
case $yn in
    [Yy]*) create shortcut; break;;
    [Nn]*) echo ""; echo "Installation Complete"; exit;;
    *) echo "Please answer yes or no.";;
esac
}

shortcut ()
{
echo ""
echo "Creating Launcher ... "
echo ""
echo "[Desktop Entry]" > /usr/share/applications/leroy-jenkins.desktop
echo "Type = Application" >> /usr/share/applications/leroy-jenkins.desktop
echo "Terminal = False" >> /usr/share/applications/leroy-jenkins.desktop
echo "Name = Leroy Jenkins" >> /usr/share/applications/leroy-jenkins.desktop
echo "Icon = /usr/share/leroy-jenkins/icon_64x64.png" >> /usr/share/applications/leroy-jenkins.desktop
echo "Exec = python /usr/share/leroy-jenkins/leroy-jenkins.py -g" >> /usr/share/applications/leroy-jenkins.desktop
echo "Installation Complete!"
}
