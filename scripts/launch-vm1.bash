#!/bin/bash

qemu-system-x86_64  \
  -enable-kvm \
  -smp 8 \
  -cpu host \
  -m 16G \
  -nographic \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -drive if=virtio,format=qcow2,file=../images/noble-server-cloudimg-amd64-vm1.img \
  -drive if=virtio,media=cdrom,file=../seeds/vm1-seed.iso \
  -device vfio-pci,host=0000:05:00.2 \
  -virtfs local,path=/home/upgautam/Downloads/bpfabsorb,mount_tag=bpfabsorb,security_model=passthrough,id=bpfabsorb

