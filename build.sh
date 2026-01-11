#!/usr/bin/env bash

set -xeuo pipefail

dnf remove -y NetworkManager

dnf install -y \
  systemd-networkd \
  systemd-networkd-defaults \
  strace \
  socat \
  tcpdump \
  netcat

for pkg in kernel kernel-core kernel-modules kernel-modules-core; do
  rpm --erase $pkg --nodeps
done

pushd /usr/lib/kernel/install.d
printf '%s\n' '#!/bin/sh' 'exit 0' > 05-rpmostree.install
printf '%s\n' '#!/bin/sh' 'exit 0' > 50-dracut.install
chmod +x  05-rpmostree.install 50-dracut.install
popd

dnf -y copr enable bieszczaders/kernel-cachyos-lto
dnf -y copr disable bieszczaders/kernel-cachyos-lto
dnf -y --enablerepo copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-lto install \
  kernel-cachyos-lto

dnf -y copr enable bieszczaders/kernel-cachyos-addons
dnf -y copr disable bieszczaders/kernel-cachyos-addons
dnf -y --enablerepo copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons swap zram-generator-defaults cachyos-settings
dnf -y --enablerepo copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons install \
  scx-scheds-git \
  scx-manager

# http://github.com/tulilirockz/maranta/
dnf install -y \
  SDL3_image

tee /usr/lib/modules-load.d/piperita-ntsync.conf <<'EOF'
ntsync
EOF

KERNEL_VERSION="$(ls /usr/lib/modules | head -n1)"
export DRACUT_NO_XATTR=1
depmod -a "$(ls -1 /lib/modules/ | tail -1)"
dracut --no-hostonly --kver "$KERNEL_VERSION" --reproducible --zstd -v --add ostree -f "/usr/lib/modules/$KERNEL_VERSION/initramfs.img"
chmod 0600 "/usr/lib/modules/${KERNEL_VERSION}/initramfs.img"
