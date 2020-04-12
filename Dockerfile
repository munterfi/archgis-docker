ARG VERSION=latest
LABEL maintainer="info@munterfinger.ch"
FROM archlinux:$VERSION

# Update pkgs
RUN pacman -Syu --noconfirm && \
  pacman -S --noconfirm base-devel git

# Nobody user
RUN mkdir /home/build && \
  chgrp nobody /home/build && \
  chmod g+ws /home/build && \
  setfacl -m u::rwx,g::rwx /home/build && \
  setfacl -d --set u::rwx,g::rwx,o::- /home/build

# Install yay
RUN git clone --quiet https://aur.archlinux.org/yay.git && \
  cd yay && \
  sudo -u nobody makepkg -si --noconfirm && \
  cd - && \
  rm -rf yay

# Spatial libraries
RUN pacman -S --noconfirm gdal geos proj

# Python3 and spatial packages
RUN pacman -S --noconfirm python python-pip && \
  pip install numpy shapely pygeos libpysal geopandas rasterio

# Base R and TK for installing packages (mirror window)
RUN pacman -S --noconfirm tk texlive-bin gcc-fortran openblas r && \
  Rscript -e 'install.packages(c("magrittr", "data.table", "dplyr"),repo = "http://cran.rstudio.com/")' && \
  Rscript -e 'install.packages(c("sf", "stars", "hereR"),repo = "http://cran.rstudio.com/")'
