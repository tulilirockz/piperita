# Project Aloy

## It's Purpose

To merge the greatness of Bazzite KDE with CachyOS Kernel.

Warning:
Rebasing between different desktop environments (e.g. KDE Plasma to GNOME) may cause issues and is unsupported. AND YOU MUST HAVE KDE TO REBASE.

How do I swap from Bazzite stock kernel to CachyOS?

Simple, open up a terminal and type in: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kitkat6464/aloy:latest ... and press enter.

AND REBOOT AND YOUR BAZZITE HAS GONE FULL DEMON MODE WITH CACHYOS KERNEL AND YOU WILL GET FUTURE UPDATES FROM THE MAIN BAZZITE JUST WITH CACHYOS KERNEL SPRINKLED ON TOP >:D

If you ever want to go back to stock, open up a terminal and type in: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:latest ... and press enter.

AND REBOOT AND YOUR KDE BAZZITE INSTALL IS BACK TO STOCK.

Thank you [Tulip](https://github.com/tulilirockz/piperita) for getting me started to adapt this for Bazzite.

GNOME COMING SOON ... Once I figured that one out.
