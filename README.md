# ansible-*-dev-client
Ansible playbook to setup a sophisticated development environment


## ansible-linux-dev-client

After setting up a minimum Ubuntu desktop system install ansible by

```shell
sudo apt install ansible git
```

and execute the public playbook to initialize and install all publicly available products for your laptop

```shell
sudo ansible-pull -vv -U https://github.com/eitzenbe/ansible-linux-dev-client -i localhost, -c local
```

As next step connect to the VPN by running 

```shell
sudo gematikvpn_simple
```

First sudo asks for your password and then openconnect asks for username, password and RSA token, this will connect you with the intranet and will allow you to proceed with the company internal configuration/installation.

# ansible-mac-dev-client

Currently in the working and definitely needs some more love and sweat but basicall it works with the same procedure as with linux but dont do root sudo and use local-mac.yml as last parameter.

Before running ansible pull make sure to install ansible via brew

```shell
brew install ansible git
``

```shell
ansible-pull -vv -U https://github.com/eitzenbe/ansible-linux-dev-client -i localhost, -c local local-mac.yml
```

