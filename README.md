
<a href="https://github.com/kitkat6464/aloy/actions/workflows/build.yml"><img src="https://github.com/kitkat6464/aloy/actions/workflows/build.yml/badge.svg" alt="Build Status" /></a>

<h1 align="center">Project Aloy</h1>
<h3 align="center">To merge the greatness of Bazzite KDE with CachyOS Kernel.</h3>

<p align="center">

## WARNINGS: 

SWITCH OFF SECURE BOOT IN BIOS UNTIL I FIND A SOLUTION ... One Day. Rebasing between different desktop environments (e.g. KDE Plasma to GNOME) may cause issues and is unsupported. AND YOU MUST HAVE KDE TO REBASE.

## How do I swap from Bazzite stock kernel to CachyOS?

Simple, open up a terminal and type in: 

`Stable: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kitkat6464/aloy:latest`

`Testing: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kitkat6464/aloy:testing`


... and press enter.

AND REBOOT AND YOUR BAZZITE HAS GONE FULL DEMON MODE WITH CACHYOS KERNEL AND YOU WILL GET FUTURE UPDATES FROM THE MAIN BAZZITE JUST WITH CACHYOS KERNEL SPRINKLED ON TOP >:D



## If you ever want to go back to stock, open up a terminal and type in: 

`rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:latest`

... and press enter.

AND REBOOT AND YOUR KDE BAZZITE INSTALL IS BACK TO STOCK.



## Thank you [Tulip](https://github.com/tulilirockz/piperita) for getting me started to adapt this for Bazzite.

## GNOME COMING SOON ... Once I figured that one out.
