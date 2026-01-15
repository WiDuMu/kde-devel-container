FROM fedora:43

ARG USERNAME=dev
ARG UID=1000
ARG GID=$UID

RUN dnf install -y sudo

RUN groupadd -g $GID $USERNAME \
    && useradd -m -u $UID -g $GID $USERNAME \
    && usermod -aG wheel $USERNAME \
    && echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN dnf update -y && dnf install -y --assumeyes \
    @development-tools \
    git \
    curl \
    file \
    htop \
    man \
    python \
    screen \
    valgrind \
    zip \
    gdb \
    bat \
    clangd \
    clang \
    extra-cmake-modules \
    kf6-kcoreaddons-devel \
    kf6-ki18n-devel \
    kf6-kxmlgui-devel \
    kf6-ktextwidgets-devel \
    kf6-kconfigwidgets-devel \
    kf6-kwidgetsaddons-devel \
    kf6-kio-devel \
    kf6-kiconthemes-devel

USER $USERNAME
