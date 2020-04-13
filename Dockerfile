ARG VERSION=latest
FROM archlinux:$VERSION
LABEL maintainer="info@munterfinger.ch"
ARG VERSION
ENV ARCHGIS_VERSION=$VERSION

# Files: Copy and pull
COPY /src/archgis_info.sh /usr/bin/archgis-info
ADD https://www.unidata.ucar.edu/downloads/udunits/udunits-2.2.26.tar.gz /usr/local/src

# pacman: Update and add libs
RUN \
  pacman -Syu --noprogressbar --noconfirm && \
  pacman -S --needed --noprogressbar --noconfirm \
    base-devel \
    gdal geos proj \
    expat \
    python python-pip \
    gcc-fortran r \
    expat

# Python: Update and add pks
RUN \
  pip list --outdated --format=freeze | \
    grep -v '^\-e' | \
    cut -d = -f 1  | \
    xargs -n1 pip install -U && \
  pip install numpy shapely pygeos libpysal geopandas rasterio

# UDUNITS 2: Install from source and link to /lib
RUN \
  cd /usr/local/src && \
  tar -xzf udunits-2.2.26.tar.gz && \
  cd /udunits-2.2.26 && \
  ./configure && \
  make && \
  make install && \
  # Symlink
  ln -s /usr/local/lib/libudunits2.so "/lib/libudunits2.so" && \
  ln -s /usr/local/lib/libudunits2.so.0 "/lib/libudunits2.so.0" && \
  ln -s /usr/local/lib/libudunits2.so.0.1.0 "/lib/libudunits2.so.0.1.0" && \
  ldconfig -v && \
  cd && \
  rm -rf /usr/local/src/udunits-2.2.26 && \
  rm -rf /usr/local/src/udunits-2.2.26.tar.gz

# R: Update and add pks
RUN \
  Rscript -e 'install.packages("units", INSTALL_opts = "--no-lock" , repo = "http://cran.rstudio.com/")' && \
  Rscript -e 'install.packages(c("magrittr", "data.table", "dplyr"),repo = "http://cran.rstudio.com/")' && \
  Rscript -e 'install.packages(c("sf", "stars", "hereR"),repo = "http://cran.rstudio.com/")'

CMD /usr/bin/archgis-info ; /usr/bin/bash
