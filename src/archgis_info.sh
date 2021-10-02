#!/usr/bin/env bash
# Modified from: https://github.com/munterfi/archgis/blob/master/src/archgis_info.sh

# Replaced figlet by text.
echo "    _             _      ____ ___ ____    ____             _             "
echo "   / \   _ __ ___| |__  / ___|_ _/ ___|  |  _ \  ___   ___| | _____ _ __ "
echo "  / _ \ | '__/ __| '_ \| |  _ | |\___ \  | | | |/ _ \ / __| |/ / _ \ '__|"
echo " / ___ \| | | (__| | | | |_| || | ___) | | |_| | (_) | (__|   <  __/ |   "
echo "/_/   \_\_|  \___|_| |_|\____|___|____/  |____/ \___/ \___|_|\_\___|_|   "
echo ""
# Information about the installed spatial libraries extension.
echo "Image:      archgis:${ARCHGIS_VERSION} FROM archlinux:${ARCHGIS_VERSION}"
echo "GDAL:       $(pacman -Q gdal | awk '{ print$2 }')"
echo "GEOS:       $(pacman -Q geos | awk '{ print$2 }')"
echo "PROJ:       $(pacman -Q proj | awk '{ print$2 }')"
echo "Maintainer: Merlin Unterfinger <info@munterfinger.ch>"
echo "License:    GNU General Public License 3.0"
echo ""
