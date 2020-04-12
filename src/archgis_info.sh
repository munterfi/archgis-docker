#!/usr/bin/env bash
# Modified from: https://github.com/munterfinger/archgis/blob/master/src/archgis_info.sh
# Prints information about the installed spatial libraries extension.

figlet "ArchGIS Docker"
echo "Image:      archgis:${ARCHGIS_VERSION} FROM archlinux:${ARCHGIS_VERSION}"
echo "GDAL:       $(pacman -Q gdal | awk '{ print$2 }')"
echo "GEOS:       $(pacman -Q geos | awk '{ print$2 }')"
echo "PROJ:       $(pacman -Q proj | awk '{ print$2 }')"
echo "Maintainer: Merlin Unterfinger <info@munterfinger.ch>"
echo "License:    GNU General Public License 3.0"
echo ""
