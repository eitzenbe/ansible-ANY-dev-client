# ansible-linux-dev-client
Ansible playbook to setup a sophisticated development environment


# Step 1 - Setup base Ubuntu system and install ansible

After setting up a minimum Ubuntu desktop system install ansible by

```
sudo apt install ansible git
```

and execute the public playbook to initialize and install all publicly available products for your laptop

```
sudo ansible-pull -vv -U https://github.com/eitzenbe/ansible-linux-dev-client -i localhost, -c local
```

As next step connect to the VPN by running 

```
gematikvpn_simple
```

After supplying username, password and RSA token, this will connect you with the intranet and will allow you to proceed with the company internal configuration/installation.
