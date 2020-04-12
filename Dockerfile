ARG VERSION=latest
FROM archlinux:$VERSION
LABEL maintainer="info@munterfinger.ch"
ARG VERSION
ENV ARCHGIS_VERSION=$VERSION

# Copy
ADD /src/add_aur.sh /usr/sbin/add-aur
ADD /src/archgis_info.sh /usr/bin/archgis-info

# Update and add devel pkgs
RUN pacman -Syu --noprogressbar --noconfirm && \
  pacman -S --needed --noprogressbar --noconfirm base-devel figlet

# Setup aur access for a new user "aurpkg"
RUN add-aur aurpkg

# Spatial libraries
RUN su aurpkg -c 'yay -S --noprogressbar --needed --noconfirm udunits' && \
  pacman -S --needed --noprogressbar --noconfirm gdal geos proj

# Python3 and spatial packages
RUN pacman -S --needed --noprogressbar --noconfirm python python-pip && \
  pip install numpy shapely pygeos libpysal geopandas rasterio

# R and spatial packages
RUN pacman -S --needed --noprogressbar --noconfirm tk texlive-bin gcc-fortran openblas r && \
  Rscript -e 'install.packages(c("magrittr", "data.table", "dplyr"),repo = "http://cran.rstudio.com/")' && \
  Rscript -e 'install.packages(c("sf", "stars", "hereR"),repo = "http://cran.rstudio.com/")'

CMD /usr/bin/archgis-info ; /usr/bin/bash
