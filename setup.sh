#!/bin/sh

ANSIBLE_DIR=/opt/ansible/

# exixt if Ansible is installed
if [ -d $ANSIBLE_DIR ]; then
	exit
fi

# update apt in case it has not been run recently
apt-get update

# download the requirements for Ansible
apt-get --no-install-recommends install -y \
  build-essential \
  git \
  python-dev \
  python-virtualenv
  
# install Ansible
mkdir -p $ANSIBLE_DIR
cd $ANSIBLE_DIR
virtualenv --distribute venv
. ./venv/bin/activate
pip install ansible

# create the Ansible so that they exist globally
for f in $(ls -1 $ANSIBLE_DIR/venv/bin/ansible* | xargs -n1 basename)
do
  echo "#!/bin/sh

. $ANSIBLE_DIR/venv/bin/activate
$f \"$@\"" > /usr/local/sbin/$f
  /bin/chmod 755 /usr/local/sbin/$f
done
