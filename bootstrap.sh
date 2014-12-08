# Boostraps ansible

if [ ! -f ~/.ssh/id_dsa ]
then
  echo Please add your ssh key before continuing
  exit 1
fi

if [ ! -f /usr/bin/xcode-select ]
then
  echo Please install xcode via App Store
  open /Applications/App\ Store.app
  exit 1
fi
/usr/bin/xcode-select -p|grep Developer > /dev/null
if [ $? != 0 ]
then
  /usr/bin/xcode-select --install
fi

if [ ! -d /usr/local/ansible ]
then
  /usr/bin/git clone git@github.com:ansible/ansible.git /usr/local/ansible
  /usr/bin/make install
fi

ansible-galaxy install -r requirements.yml
touch ~/.bash_profile
touch ~/.bash_login
#ansible-playbook desktop.yml
