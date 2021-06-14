FROM ubuntu:20.04

RUN apt-get update && apt-get install -y ansible && rm -rf /var/lib/apt/lists/*

USER root
CMD ["sh", "-c", "ansible-playbook --connection=local -i localhost, /root/ansible/main.yml"]
