Netsoc [![Build Status](https://travis-ci.org/redbrick/netsoc.png?branch=master)](https://travis-ci.org/redbrick/netsoc)
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
 * [Vagrant](http://www.vagrantup.com/downloads.html)


Installation
-------------------------

Download the repository by running `git clone https://github.com/redbrick/netsoc`.


Running
-------------------------

From the VM host, navigate to the repository and issue the command `vagrant up`. This will launch a number of VMs and begin to configure them.

Log into the management server using `vagrant ssh mgmt`.


## Networking

Networking is divided into two seperate networks, a private and a public network.

The private network is a host-only network with an addressing of `10.10.1.0/24`. This allows machines to communicate which each other privately.

The public network is a host-only network with an addressing of `10.20.1.0/24`. This is assumed to be the Internet facing side of the infrastructure even though it is not publicly addressable.

## Configuration Management

Currently netsoc is using Ansible. However depending on the use-cases and its effectiveness this may be subject to change.

Ansible is installed onto the `mgmt` server from where the VMs can be configured. To log into the management server run `vagrant ssh mgmt`.

### Installation

Ansible is installed in `/opt/ansible` using virtualenv and pip. The Ubuntu version is not used as it is out of date and is lacking several security related patches. netsoc installs Ansible scripts in `/usr/local/sbin/` so that they are accessible to the system without needing to use virtualenv manually.

### Configuration

`/etc/ansible/hosts` contains the hosts that Ansible will manage.

### Running

`ansible --list-hosts all` will display all the hosts.

To Test if the host is reachable with Ansible use `ansible all -m ping --ask-pass`.