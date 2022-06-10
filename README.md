# ansible-*-dev-client
Ansible playbook to setup a sophisticated development environment


## Linux

After setting up a minimum Ubuntu desktop system install ansible by

```shell
sudo apt install ansible git
```

and execute the public playbook to initialize and install all publicly available products for your laptop

```shell
sudo ansible-pull -vv -U https://github.com/eitzenbe/ansible-ANY-dev-client -i localhost, -c local Linux/local-linux.yml
```

As next step connect to the VPN by running 

```shell
sudo gematikvpn_simple
```

First sudo asks for your password and then openconnect asks for username, password and RSA token, this will connect you with the intranet and will allow you to proceed with the company internal configuration/installation.

## Mac

Currently in the working and definitely needs some more love and sweat but basicall it works with the same procedure as with linux but dont do root sudo and use local-mac.yml as last parameter.

First we need to install homebrew. For more details see https://brew.sh/index_de. If you feel brave and/or stupid, try the following script. It is recommend to never pipe any download directly into bash, so be advised!

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Before running ansible pull make sure to install ansible via brew

```shell
brew install ansible git
```


```shell
ansible-pull -vv -U https://github.com/eitzenbe/ansible-ANY-dev-client -i localhost, -c local MacOs/local-mac.yml
```

## Windows

Before running ansible playbooks you need to install WSL/Ubuntu and then start the local Ubuntu bash and run the ansible script there:


```shell
# clone or update your git repo
git clone https://github.com/eitzenbe/ansible-ANY-dev-client
cd ansible-ANY-dev-client
# provide your windows account credentials in subsequent call
Windows/ansible.sh PWD WINUSER
# and select the appropriate playbook (for default use local-win.yml)
```
