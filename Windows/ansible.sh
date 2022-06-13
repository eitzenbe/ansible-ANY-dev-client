#!/bin/bash
if [ $# -lt 1 ]; then
  echo "Please specify at least a password for your windows account username!"
  exit
fi


if [ $# -lt 2 ]; then
  if [ "$WINUSER" = "" ]; then
    echo "Please specify password AND windows account username or set it via env var WINUSER!"
    exit
  fi
  LOCAL_WINUSER="$WINUSER"
else
  LOCAL_WINUSER="$2"
fi

echo
echo "Creating ansible hosts file as hosts.ansible in folder '$PWD' ..."
HOSTIP=$(grep -vE "^#" /etc/resolv.conf | grep -m 1 nameserver |awk '{print $2}')

echo -e "[win]\nLOCALWINIP\n[win:vars]\nansible_user=LOCALWINUSER\nansible_password=LOCALWINPWD\nansible_connection=winrm\nansible_winrm_server_cert_validation=ignore\n" |\
sed "s/LOCALWINIP/$HOSTIP/g" | \
sed "s/LOCALWINPWD/$1/g" | \
sed "s/LOCALWINUSER/$LOCAL_WINUSER/g" > hosts.ansible

INDEX=1
ROOTFOLDER=$(dirname "$0")
echo
echo "Listing playbooks of folder '$ROOTFOLDER' ..."
echo
rm -f _tmp.ansible_playbooks_
find "$ROOTFOLDER" \( -name "*.yaml" -o -name "*.yml" \) -not -path "*/Roles/*" -type f -print | \
while read file; do
  echo "[$INDEX] $file"
  ((INDEX++))
  echo $file >> _tmp.ansible_playbooks_
done
mapfile -t YAMLFILES < _tmp.ansible_playbooks_
rm -f _tmp.ansible_playbooks_

echo
echo -n "Please select playbook by entering the index: "
read PBIDX

((PBIDX--))
echo
echo Now executing ${YAMLFILES[$PBIDX]} ...
echo

# call relevant ansible
ansible-playbook -i hosts.ansible ${YAMLFILES[$PBIDX]} -c winrm

echo
echo Removing hosts.ansible...
echo
#rm hosts.ansible
