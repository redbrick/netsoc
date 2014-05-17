#!/bin/sh

ANSIBLE_DIR=/opt/ansible/
NETSOC_DIR=/srv/netsoc/

# exit if Ansible is installed
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
  python-virtualenv \
  sshpass
  
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
$f \"\$@\"" > /usr/local/sbin/$f
  /bin/chmod 755 /usr/local/sbin/$f
done

# install the Ansible configuration
git clone https://github.com/redbrick/netsoc $NETSOC_DIR
ln -s $NETSOC_DIR/deployment/ /etc/ansible
