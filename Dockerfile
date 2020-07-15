FROM archlinux:latest
RUN pacman -Syu --noconfirm packer virtualbox qemu-headless python python-urllib3
COPY . /app
USER 9999:9999
ENTRYPOINT ["/usr/bin/packer"]
WORKDIR /app
CMD ["build", "-parallel-builds=1", "-var", "'headless=true'", "-var", "'write_zeroes=no'", "-except=vmware-iso", "vagrant.json"]
