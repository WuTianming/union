FROM rustlang/rust:nightly

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

# update the system
RUN apt-get -y update \
  && apt-get -y upgrade

# install utils
RUN apt-get install -y --no-install-recommends \
  nasm \
  grub-common \
  grub-pc-bin \
  xorriso \
  qemu-kvm

  # install rust specific packages and components
  RUN cargo install xargo && rustup component add rust-src
