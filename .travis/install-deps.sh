#!/bin/bash -x

print_debug_info () {
    printenv
    lscpu
    cat /proc/cpuinfo
    lsmod
    dmesg
    free -m
    df -h
    lsblk
    ls -la
    dpkg -l
    groups
}

upgrade_os_osx () {
    brew update
    brew upgrade
}

install_linters_osx () {
    brew install shellcheck ruby
    sudo pip2 install -U pip setuptools
    sudo pip install bashate flake8 ansible-lint
    gem install foodcritic cookstyle
    git clone https://github.com/russell/git-lint-diff.git
}

upgrade_os_linux () {
    sudo apt-get update
    sudo aptitude -y full-upgrade
}

install_linters_linux () {
    sudo pip install bashate flake8 ansible-lint
    gem install foodcritic cookstyle
    git clone https://github.com/russell/git-lint-diff.git
}

install_pytest () {
    sudo pip install testinfra
}

install_vagrant_osx () {
    sudo spctl --master-disable
    brew cask install vagrant
}

install_vagrant_linux () {
    vagrant_ver=2.2.5
    vagrant_deb="vagrant_${vagrant_ver}_x86_64.deb"
    wget "https://releases.hashicorp.com/vagrant/${vagrant_ver}/${vagrant_deb}"
    sudo dpkg -i ${vagrant_deb}
    sudo apt-get -y install libvirt-bin libvirt-dev dnsmasq qemu qemu-utils
    sudo systemctl restart libvirt-bin
    vagrant plugin install vagrant-libvirt
}

remove_dbs () {
    sudo /etc/init.d/mysql stop
    sudo /etc/init.d/postgresql stop
    sudo apt-get purge mongodb-org mongodb-org-mongos mongodb-org-server \
    mongodb-org-shell mongodb-org-tools \
    postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 \
    postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5 \
    postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6 \
    postgresql-client postgresql-client-common \
    mysql-server-5.7 mysql-server-core-5.7 mysql-client-5.7
}

if [ "${TRAVIS_OS_NAME}" == "osx" ] ; then
    :
fi

if [ "${TRAVIS_OS_NAME}" == "linux" ] ; then
    remove_dbs
fi

upgrade_os_"${TRAVIS_OS_NAME}"
install_linters_"${TRAVIS_OS_NAME}"
install_pytest
install_vagrant_"${TRAVIS_OS_NAME}"
