#!/bin/bash
#set -e
#tput setaf 0 = black
tput setaf 1 = red
tput setaf 2 = green
tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
# Funtions

echo "##################################################################"
tput setaf 2
echo "First run the version script"
tput sgr0
echo "##################################################################"

sleep 2

clean_cache() {
    if [[ "$1" == "yes" ]]; then
    	echo "##################################################################"
    	tput setaf 2
        echo "Cleaning the cache from /var/cache/pacman/pkg/"
        tput sgr0
        echo "##################################################################"
        yes | sudo pacman -Scc
    elif [[ "$1" == "no" ]]; then
        echo "Skipping cache cleaning."
    else
        echo "Invalid option. Use: clean_cache yes | clean_cache no"
    fi
}

remove_buildfolder() {

    if [[ -z "$buildFolder" ]]; then
        echo "Error: \$buildFolder is not set. Please define it before using this function."
        return 1
    fi

    if [[ "$1" == "yes" ]]; then
        if [[ -d "$buildFolder" ]]; then
        	echo "##################################################################"
    		tput setaf 3
            echo "Deleting the build folder ($buildFolder) - this may take some time..."
            tput sgr0
            sudo rm -rf "$buildFolder"
            echo "##################################################################"
        else
        	echo "##################################################################"
            echo "No build folder found. Nothing to delete."
            echo "##################################################################"
        fi
    elif [[ "$1" == "no" ]]; then
        echo "Skipping build folder removal."
    else
        echo "Invalid option. Use: remove_buildfolder yes | remove_buildfolder no"
    fi
}

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

echo
echo "################################################################## "
tput setaf 3
echo "Message (Credits to Erik from Angel G.)"
echo
echo "Do not run this file as root or add sudo in front"
echo "Run this script as a user"
echo
echo "You can add a personal local repo to the iso build if you want"
echo "https://www.youtube.com/watch?v=TqFuLknCsUE"
echo
echo "ERICK DUBOIS STUFF:"
echo "You can learn to create your own iso on the basis of Kiro (Yes I used Kiro at the beginning as a template)"
echo "That project is called Buildra"
echo "https://youtu.be/3jdKH6bLgUE"
echo "https://youtu.be/mH52To8DvlI"
tput sgr0
echo "################################################################## "
echo

sleep 3

# message for BTRFS
if 	lsblk -f | grep btrfs > /dev/null 2>&1 ; then
	echo
	echo "################################################################## "
	tput setaf 3
	echo "Message"
	echo
    echo "This script may cause issues on a Btrfs filesystem"
    echo "Make backups before continuing"
    echo "Continue at your own risk"
    echo
    echo "Press CTRL + C to stop the script now"
    tput sgr0
    echo
    for i in $(seq 10 -1 0); do
    	echo -ne "Continuing in $i seconds... \r"
    	sleep 1
    done
    echo
fi

echo
echo "################################################################## "
tput setaf 2
echo "Phase 1 : "
echo "- Setting General parameters"
tput sgr0
echo "################################################################## "
echo

	#Let us set the desktop"
	#First letter of desktop is small letter

	desktop="xfce"

	#Let us set the login manager"
	#Options: sddm | plasma-login-manager | gdm | lightdm | sonic-login-manager

	login_manager="sddm"

	xrayVersion='v26.02.16.01'

	isoLabel='xray-'$xrayVersion'-x86_64.iso'

	# setting of the general parameters
	archisoRequiredVersion="archiso 84-1"
	buildFolder=$HOME"/xray-build"
	outFolder=$HOME"/xray-Out"

	# If you want to add packages from the chaotics-aur repo then
	# change the variable to true and add the package names
	# that are hosted on chaotics-aur in the packages.x86_64 at the bottom

	chaoticsrepo=true
	xlibre=false
	sonicde=false
	audio="pipewire"
	installation_config_calamares=true
#	isLaptop=false

	if [[ "$chaoticsrepo" == "true" ]]; then
	    if pacman -Q chaotic-keyring &>/dev/null && pacman -Q chaotic-mirrorlist &>/dev/null; then
	        echo "################################################################## "
			tput setaf 2
			echo "Chaotic keyring and mirrorlist are both installed"
			tput sgr0
			echo "################################################################## "
	    else
	        if [[ -f "$installed_dir/get-the-keys-and-mirrors-chaotic-aur.sh" ]]; then
	        	echo "################################################################## "
				tput setaf 3
				echo "Installing both Chaotic packages as we are missing"
				echo "chaotic-keyring and chaotic-mirrorlist"
    			echo "You can remove them later with pacman -R ..."
				tput sgr0
				echo "################################################################## "
	            bash "$installed_dir/get-the-keys-and-mirrors-chaotic-aur.sh"
	        else
		        echo "################################################################## "
				tput setaf 1
				echo "Error: Installation script not found at $installed_dir"
				tput sgr0
				echo "################################################################## "
	            exit 1
	        fi
	    fi
	fi

echo
echo "################################################################## "
tput setaf 2
echo "Phase 1.5 :"
echo "- Backing up home directory ACLs"
tput sgr0
echo "################################################################## "
echo

# Check if home directory has default ACLs
if getfacl ~ 2>/dev/null | grep -q "default:"; then
	echo "Default ACLs detected in home directory - backing up and removing temporarily"

	# Backup current ACLs from home directory
	ACL_BACKUP_FILE="/tmp/home_acl_backup_$$.txt"
	getfacl -R ~ > "$ACL_BACKUP_FILE" 2>/dev/null
	echo "ACLs backed up to $ACL_BACKUP_FILE"

	# Set trap to restore ACLs on exit/interrupt
	restore_acls() {
		if [ -f "$ACL_BACKUP_FILE" ]; then
			echo
			echo "Restoring ACLs from backup..."
			setfacl --restore="$ACL_BACKUP_FILE" 2>/dev/null
			rm -f "$ACL_BACKUP_FILE"
			echo "ACLs restored"
		fi
	}
	trap restore_acls EXIT INT TERM

	# Remove default ACLs from home to prevent inheritance
	echo "temporarily removing default ACLs from home directory..."
	setfacl -k ~
	echo "Default ACLs removed"
	HAS_ACLS=true
else
	echo "No default ACLs found in home directory - skipping ACL management"
	HAS_ACLS=false
fi
echo


echo
echo "################################################################## "
tput setaf 2
echo "Phase 2 :"
echo "- Checking if archiso/grub is installed"
echo "- Saving current archiso version to readme"
tput sgr0
echo "################################################################## "
echo

	package="archiso"

	#----------------------------------------------------------------------------------

	#checking if application is already installed or else install
	if pacman -Qi $package &> /dev/null; then

			echo "$package is already installed"

	else

		echo "################################################################"
		echo "######### Installing $package with pacman"
		echo "################################################################"

		sudo pacman -S --noconfirm $package

	fi

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then

		echo

	else

		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "!!!!!!!!!  "$package" has NOT been installed"
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		exit 1
	fi

	package="grub"

	#----------------------------------------------------------------------------------

	#checking if application is already installed or else install
	if pacman -Qi $package &> /dev/null; then

			echo "$package is already installed"

	else

		echo "################################################################"
		echo "######### Installing $package with pacman"
		echo "################################################################"

		sudo pacman -S --noconfirm $package

	fi

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then

		echo

	else

		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "!!!!!!!!!  "$package" has NOT been installed"
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		exit 1
	fi

	# overview

	echo "################################################################## "
	tput setaf 2
	echo "Overview"
	tput sgr0
	echo "################################################################## "
	echo "Building the desktop                   : "$desktop
	echo "Building version                       : "$xrayVersion
	echo "Iso label                              : "$isoLabel
	echo "Build folder                           : "$buildFolder
	echo "Out folder                             : "$outFolder
	echo "################################################################## "
	echo

echo
echo "################################################################## "
tput setaf 2
echo "Phase 3 :"
echo "- Deleting the build folder if one exists"
echo "- Copying the Archiso folder to build folder"
tput sgr0
echo "################################################################## "
echo

	remove_buildfolder yes
	echo
	echo "Copying the Archiso folder to build work"
	echo
	mkdir $buildFolder
	cp -r ../archiso $buildFolder/archiso

echo "################################################################## "
tput setaf 2
echo "Phase 4 :"
echo "- Importing repository keys to host pacman keyring"
tput sgr0
echo "################################################################## "
echo

	# Initialize host pacman-key if needed
	sudo pacman-key --init

	if [[ "$xlibre" == "true" ]]; then
		if ! sudo pacman-key -f 73580DE2EDDFA6D6 &> /dev/null; then
			echo "Importing xlibre GPG key to host keyring"
			curl -sS https://x11libre.net/repo/arch_based/x86_64/0x73580DE2EDDFA6D6.gpg | sudo pacman-key --add -
			sudo pacman-key --recv-keys 73580DE2EDDFA6D6
			sudo pacman-key --lsign-key 73580DE2EDDFA6D6
		fi

		# Add xlibre repo config to build pacman.conf
		if ! grep -q '\[xlibre\]' $buildFolder/archiso/airootfs/etc/pacman.conf; then
			echo "Adding xlibre repository to build pacman.conf"
			echo -e '\n[xlibre]\nServer = https://x11libre.net/repo/arch_based/x86_64/' | sudo tee -a $buildFolder/archiso/airootfs/etc/pacman.conf
		fi
	fi

	# Importing Xray key to host keyring
	# echo "Importing Xray key to host pacman keyring..."
	# sudo pacman-key --recv-keys E1BFF6BFA014BE2D23A6F120D82FFD9F05908504
	# sudo pacman-key --lsign-key E1BFF6BFA014BE2D23A6F120D82FFD9F05908504
 #
	# if [[ "$sonicde" == "true" ]]; then
	# 	if ! sudo pacman-key -l 3B87898C73F11DF5 &> /dev/null; then
	# 		echo "Importing SonicDE key to host pacman keyring"
	# 		sudo pacman-key --recv-keys D82FFD9F05908504
	# 		sudo pacman-key --lsign-key D82FFD9F05908504
	# 	fi
	# fi


echo "################################################################## "
tput setaf 2
echo "Phase 5 :"
echo "- Getting the last version of bashrc in /etc/skel"
echo "- Getting the latest Xray_OS mirrorlists in /etc/pacman.d/"
echo "- Removing the old packages.x86_64 file from build folder"
echo "- Copying the new packages.x86_64 file to the build folder"
tput sgr0
echo "################################################################## "
echo

	########################################################
	# GETTING THE LATEST BASHRC FROM GITLAB
	########################################################
	echo "Deleting any possible outdated .bashrc in /etc/skel"
	rm -rf $buildFolder/archiso/airootfs/etc/skel/.bashrc
	echo

	echo "Getting the lastest .bashrc in /etc/skel"
	echo
	wget https://gitlab.com/xr-os/xray-bashrc/-/raw/main/etc/skel/.bashrc -O $buildFolder/archiso/airootfs/etc/skel/.bashrc

	########################################################
	# GETTING THE LATEST MIRRORLISTS FROM GITLAB
	########################################################
	echo "Deleting any possible outdated mirrorlists in /etc/pacman.d"
	rm -rf $buildFolder/archiso/airootfs/etc/pacman.d/mirrorlists
	rm -rf $buildFolder/archiso/airootfs/etc/pacman.d/xray-generic-repos
	echo

	echo "Getting the lastest mirrorlists in /etc/pacman.d"
	echo
	wget https://gitlab.com/xr-os/xray-mirrorlists/-/raw/main/etc/pacman.d/mirrorlist -O $buildFolder/archiso/airootfs/etc/pacman.d/mirrorlist

	wget https://gitlab.com/xr-os/xray-generic-mirrorlists/-/raw/main/etc/pacman.d/xray-generic-repos -O $buildFolder/archiso/airootfs/etc/pacman.d/xray-generic-repos


	########################################################
	# GETTING THE LATEST MIRRORLISTS FROM GITLAB
	########################################################
	echo "Deleting any possible outdated plymouth config in /etc/plymouth"
	rm -rf $buildFolder/archiso/airootfs/etc/plymouth/plymouthd.conf
	echo

	echo "Getting the lastest plymouth config in /etc/plymouth"
	echo
	wget https://gitlab.com/xr-os/xray-plymouth-config/-/raw/main/etc/plymouth/plymouthd.conf -O $buildFolder/archiso/airootfs/etc/plymouth/plymouthd.conf

	########################################################
	# PKGS
	########################################################
	echo "Removing the old packages.x86_64 file from build folder"
	rm $buildFolder/archiso/packages.x86_64
	echo

	echo "Copying the new packages.x86_64 file to the build folder"
	cp -f ../archiso/packages.x86_64 $buildFolder/archiso/packages.x86_64
	echo

	# Nvidia driver selection
	# open | 580xx | 390xx
	nvidia_driver="open"

 	##############################################
 	# Nvidia driver selection
 	##############################################

 	PACKAGES_FILE="$buildFolder/archiso/packages.x86_64"

 	#########################################################################
	## Installation Config for Calamares
	#########################################################################
	if [[ "$installation_config_calamares" == "true" ]]; then
		echo "################################################################## "
		tput setaf 3
		echo "Converting 'xray-installation-config' to 'xray-installation-config-calamares'"
		tput sgr0
		echo "################################################################## "

		sed -i 's|^xray-installation-config-|xray-installation-config-calamares-|g' "$PACKAGES_FILE"

		## Copying the Calamares .desktop file directly into airootfs skeleton
		if [[ -f "$buildFolder/archiso/airootfs/usr/share/applications/xray-installer.desktop" ]]; then
			mkdir -p "$buildFolder/archiso/airootfs/etc/skel/Desktop"
			cp -f "$buildFolder/archiso/airootfs/usr/share/applications/xray-installer.desktop" "$buildFolder/archiso/airootfs/etc/skel/Desktop/"
		fi
	fi

	#########################################################################
	## Desktop Environments
	#########################################################################

	# If building XFCE, comment out PLASMA, GNOME and SONICDE specific packages
	if [[ "$desktop" == "xfce" ]]; then
		echo "################################################################## "
		tput setaf 3
		echo "Commenting out Plasma packages for XFCE build"
		tput sgr0
		echo "################################################################## "

		## Comment out specific PLASMA packages ##
		#========================================
		sed -i '/^xray-kde-dark/d' "$PACKAGES_FILE"
		sed -i '/^xray-kde-settings/d' "$PACKAGES_FILE"
		sed -i '/^plasma/d' "$PACKAGES_FILE"
		sed -i '/^dolphin/d' "$PACKAGES_FILE"
		sed -i '/^dolphin-plugins/d' "$PACKAGES_FILE"
		sed -i '/^kio-admin/d' "$PACKAGES_FILE"
		sed -i '/^kdegraphics-thumbnailers/d' "$PACKAGES_FILE"
		sed -i '/^ark/d' "$PACKAGES_FILE"
		sed -i '/^kcalc/d' "$PACKAGES_FILE"
		sed -i '/^gwenview/d' "$PACKAGES_FILE"
		sed -i '/^spectacle/d' "$PACKAGES_FILE"
		sed -i '/^kdeconnect/d' "$PACKAGES_FILE"
		sed -i '/^kwalletmanager/d' "$PACKAGES_FILE"
		sed -i '/^konsole/d' "$PACKAGES_FILE"
		sed -i '/^tolitica-plasma-theme/d' "$PACKAGES_FILE"
		sed -i '/^xray-kde-dark/d' "$PACKAGES_FILE"
		sed -i '/^arch-kde-theme/d' "$PACKAGES_FILE"
		sed -i '/^dtos-kde-theme/d' "$PACKAGES_FILE"
		sed -i '/^viper-kde-theme/d' "$PACKAGES_FILE"
		sed -i '/^kwin-x11/d' "$PACKAGES_FILE"
		sed -i '/^kwayland-integration/d' "$PACKAGES_FILE"

		## Comment out specific GNOME packages ##
		#========================================
		sed -i '/^gnome/d' "$PACKAGES_FILE"
		sed -i '/^gnome-extra/d' "$PACKAGES_FILE"
		sed -i '/^xray-gnome-settings/d' "$PACKAGES_FILE"

		## Comment out specific SONICDE packages ##
		#========================================
		sed -i '/^sonicde/d' "$PACKAGES_FILE"
		sed -i '/^sonic-activities/d' "$PACKAGES_FILE"
		sed -i '/^sonic-audio-applet-pulse/d' "$PACKAGES_FILE"
		sed -i '/^sonic-decoration/d' "$PACKAGES_FILE"
		sed -i '/^sonic-desktop-interface/d' "$PACKAGES_FILE"
		sed -i '/^sonic-interface-libraries/d' "$PACKAGES_FILE"
		sed -i '/^sonic-keybind-daemon/d' "$PACKAGES_FILE"
		sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
		sed -i '/^sonic-network-manager/d' "$PACKAGES_FILE"
		sed -i '/^sonic-night-light/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screen/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screen-library/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screenlocker/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-theme/d' "$PACKAGES_FILE"
		sed -i '/^sonic-sysguard-library/d' "$PACKAGES_FILE"
		sed -i '/^sonic-system-info sonic-win/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace-addons/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace-wallpapers/d' "$PACKAGES_FILE"
		sed -i '/^sonic-x11-session/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
		sed -i '/^xray-sonicde-settings/d' "$PACKAGES_FILE"

		# Replace some specific packages
		sed -i 's/^xray-wallpapers$/xray-xfce-wallpapers/' "$PACKAGES_FILE"
	fi

	# If building PLASMA, comment out XFCE, GNOME and SONICDE specific packages
	if [[ "$desktop" == "plasma" ]]; then
		echo "################################################################## "
		tput setaf 3
		echo "Commenting out Xfce4 packages for Plasma build"
		tput sgr0
		echo "################################################################## "

		## Comment out specific XFCE packages ##
		#========================================
		sed -i '/^xfce4/d' "$PACKAGES_FILE"
		sed -i '/^xfce4-goodies/d' "$PACKAGES_FILE"
		sed -i '/^xray-xfce-settings/d' "$PACKAGES_FILE"
		sed -i '/^gvfs/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-afc/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-gphoto2/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-mtp/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-nfs/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-smb/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-dnssd/d' "$PACKAGES_FILE"
		sed -i '/^flameshot/d' "$PACKAGES_FILE"
		sed -i '/^vlc/d' "$PACKAGES_FILE"
		sed -i '/^xcape/d' "$PACKAGES_FILE"
		sed -i '/^arandr/d' "$PACKAGES_FILE"
		sed -i '/^catfish/d' "$PACKAGES_FILE"
		sed -i '/^evince/d' "$PACKAGES_FILE"
		sed -i '/^file-roller/d' "$PACKAGES_FILE"
		sed -i '/^gnome-disk-utility/d' "$PACKAGES_FILE"
		sed -i '/^gnome-keyring/d' "$PACKAGES_FILE"
		sed -i '/^gnome-screenshot/d' "$PACKAGES_FILE"
		sed -i '/^nomacs/d' "$PACKAGES_FILE"
		sed -i '/^playerctl/d' "$PACKAGES_FILE"
		sed -i '/^polkit-gnome/d' "$PACKAGES_FILE"
		sed -i '/^qt5ct/d' "$PACKAGES_FILE"
		sed -i '/^gittyup/d' "$PACKAGES_FILE"
		sed -i '/^hardcode-fixer-git/d' "$PACKAGES_FILE"
		sed -i '/^mugshot/d' "$PACKAGES_FILE"
		sed -i '/^autorandr/d' "$PACKAGES_FILE"
		sed -i '/^volumeicon/d' "$PACKAGES_FILE"
		sed -i '/^surfn-icons-git/d' "$PACKAGES_FILE"
		sed -i '/^numix-icon-theme-git/d' "$PACKAGES_FILE"
		sed -i '/^numix-circle-icon-theme-git/d' "$PACKAGES_FILE"
		sed -i '/^sardi-icons/d' "$PACKAGES_FILE"

		## Comment out specific GNOME packages ##
		#========================================
		sed -i '/^gnome/d' "$PACKAGES_FILE"
		sed -i '/^gnome-extra/d' "$PACKAGES_FILE"
		sed -i '/^xray-gnome-settings/d' "$PACKAGES_FILE"

		## Comment out specific SONICDE packages ##
		#========================================
		sed -i '/^sonicde/d' "$PACKAGES_FILE"
		sed -i '/^sonic-activities/d' "$PACKAGES_FILE"
		sed -i '/^sonic-audio-applet-pulse/d' "$PACKAGES_FILE"
		sed -i '/^sonic-decoration/d' "$PACKAGES_FILE"
		sed -i '/^sonic-desktop-interface/d' "$PACKAGES_FILE"
		sed -i '/^sonic-interface-libraries/d' "$PACKAGES_FILE"
		sed -i '/^sonic-keybind-daemon/d' "$PACKAGES_FILE"
		sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
		sed -i '/^sonic-network-manager/d' "$PACKAGES_FILE"
		sed -i '/^sonic-night-light/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screen/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screen-library/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screenlocker/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-theme/d' "$PACKAGES_FILE"
		sed -i '/^sonic-sysguard-library/d' "$PACKAGES_FILE"
		sed -i '/^sonic-system-info sonic-win/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace-addons/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace-wallpapers/d' "$PACKAGES_FILE"
		sed -i '/^sonic-x11-session/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
		sed -i '/^xray-sonicde-settings/d' "$PACKAGES_FILE"

		# Replaces some specific packages
		sed -i 's/^xray-xfce-wallpapers$/xray-wallpapers/' "$PACKAGES_FILE"
	fi

	# If building SONICDE, comment out XFCE, GNOME and PLASMA specific packages
	if [[ "$desktop" == "sonicde" ]]; then
		echo "################################################################## "
		tput setaf 3
		echo "Commenting out Xfce4 packages for SonicDE build"
		tput sgr0
		echo "################################################################## "

		## Comment out specific XFCE packages ##
		#========================================
		sed -i '/^xfce4/d' "$PACKAGES_FILE"
		sed -i '/^xfce4-goodies/d' "$PACKAGES_FILE"
		sed -i '/^xray-xfce-settings/d' "$PACKAGES_FILE"
		sed -i '/^gvfs/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-afc/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-gphoto2/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-mtp/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-nfs/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-smb/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-dnssd/d' "$PACKAGES_FILE"
		sed -i '/^flameshot/d' "$PACKAGES_FILE"
		sed -i '/^vlc/d' "$PACKAGES_FILE"
		sed -i '/^xcape/d' "$PACKAGES_FILE"
		sed -i '/^arandr/d' "$PACKAGES_FILE"
		sed -i '/^catfish/d' "$PACKAGES_FILE"
		sed -i '/^evince/d' "$PACKAGES_FILE"
		sed -i '/^file-roller/d' "$PACKAGES_FILE"
		sed -i '/^gnome-disk-utility/d' "$PACKAGES_FILE"
		sed -i '/^gnome-keyring/d' "$PACKAGES_FILE"
		sed -i '/^gnome-screenshot/d' "$PACKAGES_FILE"
		sed -i '/^nomacs/d' "$PACKAGES_FILE"
		sed -i '/^playerctl/d' "$PACKAGES_FILE"
		sed -i '/^polkit-gnome/d' "$PACKAGES_FILE"
		sed -i '/^qt5ct/d' "$PACKAGES_FILE"
		sed -i '/^gittyup/d' "$PACKAGES_FILE"
		sed -i '/^hardcode-fixer-git/d' "$PACKAGES_FILE"
		sed -i '/^mugshot/d' "$PACKAGES_FILE"
		sed -i '/^autorandr/d' "$PACKAGES_FILE"
		sed -i '/^volumeicon/d' "$PACKAGES_FILE"
		sed -i '/^surfn-icons-git/d' "$PACKAGES_FILE"
		sed -i '/^numix-icon-theme-git/d' "$PACKAGES_FILE"
		sed -i '/^numix-circle-icon-theme-git/d' "$PACKAGES_FILE"
		sed -i '/^sardi-icons/d' "$PACKAGES_FILE"

		## Comment out specific GNOME packages ##
		#========================================
		sed -i '/^gnome/d' "$PACKAGES_FILE"
		sed -i '/^gnome-extra/d' "$PACKAGES_FILE"
		sed -i '/^xray-gnome-settings/d' "$PACKAGES_FILE"

		## Comment out specific PLASMA packages ##
		#========================================
		sed -i '/^plasma/d' "$PACKAGES_FILE"
		sed -i '/^kwin-x11/d' "$PACKAGES_FILE"
		sed -i '/^xray-kde-settings/d' "$PACKAGES_FILE"

		# Replaces some specific packages
		sed -i 's/^xray-xfce-wallpapers$/xray-wallpapers/' "$PACKAGES_FILE"
	fi

	# If building GNOME, comment out Xfce4, PLASMA and SONICDE specific packages
	if [[ "$desktop" == "gnome" ]]; then
		echo "################################################################## "
		tput setaf 3
		echo "Commenting out PLASMA and XFCE specific PKGs"
		tput sgr0
		echo "################################################################## "

		## Comment out specific XFCE packages ##
		#========================================
		sed -i '/^gvfs/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-afc/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-gphoto2/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-mtp/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-nfs/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-smb/d' "$PACKAGES_FILE"
		sed -i '/^gvfs-dnssd/d' "$PACKAGES_FILE"
		sed -i '/^flameshot/d' "$PACKAGES_FILE"
		sed -i '/^xcape/d' "$PACKAGES_FILE"
		sed -i '/^arandr/d' "$PACKAGES_FILE"
		sed -i '/^catfish/d' "$PACKAGES_FILE"
		sed -i '/^evince/d' "$PACKAGES_FILE"
		sed -i '/^file-roller/d' "$PACKAGES_FILE"
		sed -i '/^nomacs/d' "$PACKAGES_FILE"
		sed -i '/^playerctl/d' "$PACKAGES_FILE"
		sed -i '/^qt5ct/d' "$PACKAGES_FILE"
		sed -i '/^gittyup/d' "$PACKAGES_FILE"
		sed -i '/^hardcode-fixer-git/d' "$PACKAGES_FILE"
		sed -i '/^mugshot/d' "$PACKAGES_FILE"
		sed -i '/^autorandr/d' "$PACKAGES_FILE"
		sed -i '/^volumeicon/d' "$PACKAGES_FILE"
		sed -i '/^xray-xfce-settings/d' "$PACKAGES_FILE"

		## Comment out specific PLASMA packages ##
		#========================================
		sed -i '/^xray-kde-dark/d' "$PACKAGES_FILE"
		sed -i '/^xray-kde-settings/d' "$PACKAGES_FILE"
		sed -i '/^plasma/d' "$PACKAGES_FILE"
		sed -i '/^dolphin/d' "$PACKAGES_FILE"
		sed -i '/^dolphin-plugins/d' "$PACKAGES_FILE"
		sed -i '/^kio-admin/d' "$PACKAGES_FILE"
		sed -i '/^kdegraphics-thumbnailers/d'
		sed -i '/^ark/d' "$PACKAGES_FILE"
		sed -i '/^kcalc/d' "$PACKAGES_FILE"
		sed -i '/^gwenview/d' "$PACKAGES_FILE"
		sed -i '/^spectacle/d' "$PACKAGES_FILE"
		sed -i '/^kdeconnect/d' "$PACKAGES_FILE"
		sed -i '/^kwalletmanager/d' "$PACKAGES_FILE"
		sed -i '/^konsole/d' "$PACKAGES_FILE"
		sed -i '/^tolitica-plasma-theme/d' "$PACKAGES_FILE"
		sed -i '/^xray-kde-dark/d' "$PACKAGES_FILE"
		sed -i '/^arch-kde-theme/d' "$PACKAGES_FILE"
		sed -i '/^dtos-kde-theme/d' "$PACKAGES_FILE"
		sed -i '/^viper-kde-theme/d' "$PACKAGES_FILE"
		sed -i '/^kwin-x11/d' "$PACKAGES_FILE"
		sed -i '/^kwayland-integration/d' "$PACKAGES_FILE"

		## Comment out specific SONICDE packages ##
		#========================================
		sed -i '/^sonicde/d' "$PACKAGES_FILE"
		sed -i '/^sonic-activities/d' "$PACKAGES_FILE"
		sed -i '/^sonic-audio-applet-pulse/d' "$PACKAGES_FILE"
		sed -i '/^sonic-decoration/d' "$PACKAGES_FILE"
		sed -i '/^sonic-desktop-interface/d' "$PACKAGES_FILE"
		sed -i '/^sonic-interface-libraries/d' "$PACKAGES_FILE"
		sed -i '/^sonic-keybind-daemon/d' "$PACKAGES_FILE"
		sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
		sed -i '/^sonic-network-manager/d' "$PACKAGES_FILE"
		sed -i '/^sonic-night-light/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screen/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screen-library/d' "$PACKAGES_FILE"
		sed -i '/^sonic-screenlocker/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-theme/d' "$PACKAGES_FILE"
		sed -i '/^sonic-sysguard-library/d' "$PACKAGES_FILE"
		sed -i '/^sonic-system-info sonic-win/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace-addons/d' "$PACKAGES_FILE"
		sed -i '/^sonic-workspace-wallpapers/d' "$PACKAGES_FILE"
		sed -i '/^sonic-x11-session/d' "$PACKAGES_FILE"
		sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
		sed -i '/^xray-sonicde-settings/d' "$PACKAGES_FILE"

		# Replace some specific packages
		sed -i 's/^xray-wallpapers$/xray-gnome-wallpapers' "$PACKAGES_FILE"
	fi

	#########################################################################
	## Display Manager / Login Manager Selection (Centralized)
	#########################################################################
	echo "################################################################## "
	tput setaf 3
	echo "Configuring display manager: $login_manager"
	tput sgr0
	echo "################################################################## "

	case "$login_manager" in
		"sddm")
			# Keep sddm, remove others
			sed -i '/^plasma-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^gdm/d' "$PACKAGES_FILE"
			sed -i '/^lightdm/d' "$PACKAGES_FILE"
			sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^xray-sddm-simplicity-git/d' "$PACKAGES_FILE"
			sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
			# Set display-manager symlink to sddm
			sudo ln -sf /usr/lib/systemd/system/sddm.service $buildFolder/archiso/airootfs/etc/systemd/system/display-manager.service
			;;
		"plasma-login-manager")
			# Keep plasma-login-manager, remove others
			sed -i '/^sddm/d' "$PACKAGES_FILE"
			sed -i '/^gdm/d' "$PACKAGES_FILE"
			sed -i '/^lightdm/d' "$PACKAGES_FILE"
			sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^xray-sddm-simplicity-git/d' "$PACKAGES_FILE"
			sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
			# Set display-manager symlink to plasmalogin
			sudo ln -sf /usr/lib/systemd/system/plasmalogin.service $buildFolder/archiso/airootfs/etc/systemd/system/display-manager.service
			;;
		"gdm")
			# Keep gdm, remove others
			sed -i '/^sddm/d' "$PACKAGES_FILE"
			sed -i '/^plasma-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^lightdm/d' "$PACKAGES_FILE"
			sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^xray-sddm-simplicity-git/d' "$PACKAGES_FILE"
			sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
			# Set display-manager symlink to gdm
			sudo ln -sf /usr/lib/systemd/system/gdm.service $buildFolder/archiso/airootfs/etc/systemd/system/display-manager.service
			;;
		"lightdm")
			# Keep lightdm, remove others
			sed -i '/^sddm/d' "$PACKAGES_FILE"
			sed -i '/^plasma-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^gdm/d' "$PACKAGES_FILE"
			sed -i '/^sonic-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^xray-sddm-simplicity-git/d' "$PACKAGES_FILE"
			sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
			# Set display-manager symlink to lightdm
			sudo ln -sf /usr/lib/systemd/system/lightdm.service $buildFolder/archiso/airootfs/etc/systemd/system/display-manager.service
			;;
		"sonic-login-manager")
			# Keep sonic-login-manager, remove others
			sed -i '/^sddm/d' "$PACKAGES_FILE"
			sed -i '/^plasma-login-manager/d' "$PACKAGES_FILE"
			sed -i '/^gdm/d' "$PACKAGES_FILE"
			sed -i '/^lightdm/d' "$PACKAGES_FILE"
			sed -i '/^xray-sddm-simplicity-git/d' "$PACKAGES_FILE"
			sed -i '/^sonic-silver-sddm/d' "$PACKAGES_FILE"
			# Set display-manager symlink to soniclogin
			sudo ln -sf /usr/lib/systemd/system/soniclogin.service $buildFolder/archiso/airootfs/etc/systemd/system/display-manager.service
			;;
		*)
			echo "Unknown login manager: $login_manager"
			echo "Valid options: sddm | plasma-login-manager | gdm | lightdm | sonic-login-manager"
			exit 1
			;;
	esac

	#########################################################################
	## Display Protocols
	#########################################################################

	if [[ "$xlibre" == "true" ]]; then
		echo "##################################################################"
		tput setaf 3
		echo "Modifying package list to replace xorg with xlibre if enabled"
		tput sgr0
		echo "##################################################################"

		# Define packages that do NOT have xlibre equivalents and must remain as xorg
		NO_XLIBRE_EQUIV=(
			"xorg-xinit" "xorg-xkill" "xorg-xrandr" "xorg-xrdb" "xorg-xwayland"
			"xorg-xprop" "xorg-xset" "xorg-xmodmap" "xorg-xev" "xorg-xinfo"
			"xorg-xdpyinfo" "xorg-xgamma" "xorg-xsetroot" "xorg-iceauth"
			"xorg-mkfontdir" "xorg-mkfontscale" "xorg-sessreg" "xorg-smproxy"
			"xorg-x11perf" "xorg-xauth" "xorg-xbacklight" "xorg-xcmsdb"
			"xorg-xcursorgen" "xorg-xdg-user-dirs" "xorg-xdriinfo" "xorg-xfs"
			"xorg-xhost" "xorg-xinput" "xorg-xkbcomp" "xorg-xkbevd" "xorg-xkbutils"
			"xorg-xlsatoms" "xorg-xlsclients" "xorg-xmessage" "xorg-xpr"
			"xorg-xprehashprinterlist" "xorg-xrefresh" "xorg-xvinfo" "xorg-xwd"
			"xorg-xwininfo" "xorg-xwud"
		)

		TEMP_PACKAGES=$(mktemp)

		while IFS= read -r pkg; do
			[[ -z "$pkg" || "$pkg" =~ ^# ]] && { echo "$pkg" >> "$TEMP_PACKAGES"; continue; }

			skip=false
			for excluded in "${NO_XLIBRE_EQUIV[@]}"; do
				if [[ "$pkg" == "$excluded" ]]; then
					skip=true
					echo "Skipping $pkg (no xlibre equivalent)"
					break
				fi
			done

			[[ "$skip" == false ]] && echo "$pkg" >> "$TEMP_PACKAGES"
		done < "$PACKAGES_FILE"

		mv "$TEMP_PACKAGES" "$PACKAGES_FILE"

		sed -i 's/^xorg-server$/xlibre-xserver/' "$PACKAGES_FILE"
		sed -i 's/xf86-input-/xlibre-input-/g' "$PACKAGES_FILE"
		sed -i 's/xf86-video-/xlibre-video-/g' "$PACKAGES_FILE"
		sed -i 's/^#xlibre-/xlibre-/g' "$PACKAGES_FILE"

		grep -q '^xlibre-xserver-common$' "$PACKAGES_FILE" || echo "xlibre-xserver-common" >> "$PACKAGES_FILE"
	fi

#########################################################################
## Audio Protocols
#########################################################################
if [[ "$audio" == "pulseaudio" ]]; then
	echo "################################################################## "
	tput setaf 3
	echo "Converting and commenting/uncommenting out specific pipewire audio pkgs"
	tput sgr0
	echo "################################################################## "

	sed -i '/^pipewire-/pulseaudio-/g' "$PACKAGES_FILE"
	sed -i '/^pipewire-alsa-/pulseaudio-alsa/g' "$PACKAGES_FILE"
	sed -i 's/^#\s*pulseaudio-bluetooth/pulseaudio-bluetooth/' "$PACKAGES_FILE"
	sed -i '/^pipewire-pulse/d' "$PACKAGES_FILE"
	sed -i '/^gst-plugin-pipewire/d' "$PACKAGES_FILE"
fi

if [[ "$audio" == "pipewire" ]]; then
	echo "################################################################## "
	tput setaf 3
	echo "Commenting out specific pulseaudio audio pkgs"
	tput sgr0
	echo "################################################################## "

	sed -i '/^pulseaudio/d' "$PACKAGES_FILE"
	sed -i '/^pulseaudio-alsa/d' "$PACKAGES_FILE"
	sed -i '/^pulseaudio-bluetooth/d' "$PACKAGES_FILE"
fi

echo
echo "################################################################## "
tput setaf 2
echo "Phase 6 : "
echo "- Adding time to /etc/dev-rel"
echo "- Clean cache"
tput sgr0
echo "################################################################## "
echo

	echo "Adding time to /etc/dev-rel"
	date_build=$(date -d now)
	echo "Iso build on : "$date_build
	sudo sed -i "s/\(^ISO_BUILD=\).*/\1$date_build/" $buildFolder/archiso/airootfs/etc/dev-rel

	echo
	clean_cache no

echo
echo "################################################################## "
tput setaf 2
echo "Phase 7 :"
echo "- Building the iso - this can take a while - be patient"
tput sgr0
echo "################################################################## "
echo

	[ -d $outFolder ] || mkdir $outFolder
	cd $buildFolder/archiso/
	sudo mkarchiso -v -w $buildFolder -o $outFolder $buildFolder/archiso/

echo
echo "###################################################################"
tput setaf 2
echo "Phase 8 :"
echo "- Creating checksums"
echo "- Copying pgklist"
tput sgr0
echo "###################################################################"
echo

	cd $outFolder

	echo "Creating checksums for : "$isoLabel
	echo "##################################################################"
	echo
	echo "Building sha1sum"
	echo "########################"
	sha1sum $isoLabel | tee $isoLabel.sha1
	echo "Building sha256sum"
	echo "########################"
	sha256sum $isoLabel | tee $isoLabel.sha256
	echo "Building md5sum"
	echo "########################"
	md5sum $isoLabel | tee $isoLabel.md5
	echo
	echo "Moving pkglist.x86_64.txt"
	echo "########################"
	cp $buildFolder/iso/arch/pkglist.x86_64.txt  $outFolder/$isoLabel".pkglist.txt"

echo
echo "##################################################################"
tput setaf 2
echo "Phase 9 :"
echo "- Removing the buildfolder or not"
tput sgr0
echo "################################################################## "
echo

	echo "Deleting the build folder if one exists - takes some time"
	remove_buildfolder no

if [ "$HAS_ACLS" = true ]; then
	echo
	echo "################################################################## "
	tput setaf 2
	echo "Phase 11 :"
	echo "- Restoring home directory ACLs"
	tput sgr0
	echo "################################################################## "
	echo

	restore_acls
fi

echo
echo "##################################################################"
tput setaf 2
echo "DONE"
echo "- Check your out folder :"$outFolder
tput sgr0
echo "################################################################## "
echo
