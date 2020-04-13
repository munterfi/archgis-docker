[![](https://images.microbadger.com/badges/image/munterfi/archgis.svg)](https://microbadger.com/images/munterfi/archgis)
[![](https://images.microbadger.com/badges/version/munterfi/archgis.svg)](https://microbadger.com/images/munterfi/archgis)

# Docker Image of ArchGIS

Extension for Arch Linux that enables processing, analyzing and storing spatial data (Libs: Udunits2, GDAL, GEOS and PROJ; Tools: Python and R).

## Usage

Pull built image from Docker Hub and run a instance:
```bash
docker run munterfi/archgis:latest
>    _             _      ____ ___ ____    ____             _             
>   / \   _ __ ___| |__  / ___|_ _/ ___|  |  _ \  ___   ___| | _____ _ __
>  / _ \ | '__/ __| '_ \| |  _ | |\___ \  | | | |/ _ \ / __| |/ / _ \ '__|
> / ___ \| | | (__| | | | |_| || | ___) | | |_| | (_) | (__|   <  __/ |   
>/_/   \_\_|  \___|_| |_|\____|___|____/  |____/ \___/ \___|_|\_\___|_|   
>                                                                         
>Image:      archgis:latest FROM archlinux:latest
>GDAL:       3.0.4-5
>GEOS:       3.8.0-1
>PROJ:       6.3.1-1
>Maintainer: Merlin Unterfinger <info@munterfinger.ch>
>License:    GNU General Public License 3.0
>
```

Build the image locally:
```bash
git clone https://github.com/munterfinger/archgis-docker.git
./build.sh
```

Run the local image interactively:
```bash
./run.sh
```

## References

* [Docker Base Image for Arch Linux](https://github.com/archlinux/archlinux-docker)
* [ArchGIS extension for Arch Linux](https://github.com/munterfinger/archgis)
