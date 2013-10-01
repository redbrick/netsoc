Netsoc
================================

About
-------------------------

> While you're waiting, read the free novel we sent you. It's a Spanish story about a 
> guy named 'Manual'. - Dilbert

This document details the process for running an entire networking society's infrastructure in a virtualised fashion.

The assumed distribution for running the virtual machines is Ubuntu LTS, currently 12.04.3 (Precise Pangolin). The setup has been shown to run on both Windows and Linux distributions.


Prerequisites
-------------------------

Download and install the latest version of:

 * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 * [Vagrant](http://downloads.vagrantup.com/tags/v1.3.3/)


Installation
-------------------------

Download the repository by running `git clone https://github.com/redbrick/netsoc`.


Running
-------------------------

From the VM host, navigate to the repository and issue the command `vagrant up`. This will launch a number of VMs and begin to configure them.

Log into the management server using `vagrant ssh mgmt`.


## Networking

Networking is divided into two seperate networks, a private and a public network.

The private network is a host-only network with an addressing of `10.1.1.0/24`. This allows machines to communicate which each other privately.

The public network is a host-only network with an addressing of `10.2.2.0/24`. This is assumed to be the Internet facing side of the infrastructure even though it is not publicly addressable.

## Configuration Management

Currently netsoc is using Ansible. However depending on the use-cases and its effectiveness this may be subject to change.

Ansible is installed onto the `mgmt` server from where the VMs can be configured. To log into the management server run `vagrant ssh mgmt`.

### Installation

Ansible is installed into `/opt/ansible` using virtualenv and pip. The Ubuntu version is not used as it is out of date and is lacking several security related patches.

    $ apt-get update && apt-get install python-dev python-virtualenv
    $ mkdir -p /opt/ansible/
    $ cd /opt/ansible/
    $ virtualenv --distribute venv
    $ . ./venv/bin/activate
    $ pip install ansible

The following script is in `/usr/local/sbin/ansible` which will allow us to reference ansible.

    #!/bin/sh
    
    . /opt/ansible/venv/bin/activate
    ansible "$@"

The following script is in `/usr/local/sbin/ansible-playbook` which will allow us to reference ansible-playbook.

    #!/bin/sh
    . /opt/ansible/venv/bin/activate
    ansible-playbook "$@"  

### Configuration

`/etc/ansible/hosts` contains the hosts that Ansible will manage.

### Running

`ansible --list-hosts all` will display all the hosts.

To Test if the host is reachable with Ansible use `ansible all -m ping --ask-pass`.