# Ansible Linux based Java role

![Python](https://img.shields.io/pypi/pyversions/testinfra.svg?style=flat)
![Licence](https://img.shields.io/github/license/kube-cloud/ansible-role-gradle.svg?style=flat)
[![Travis Build](https://img.shields.io/travis/kube-cloud/ansible-role-gradle.svg?style=flat)](https://travis-ci.com/kube-cloud/ansible-role-gradle)
[![Galaxy Role Downloads](https://img.shields.io/ansible/role/d/42169.svg?style=flat)](https://galaxy.ansible.com/jetune/gradle)

Ansible role used to install Gradle on Linux based Operating System.

<a href="https://www.kube-cloud.com/"><img width="300" src="https://kube-cloud.com/images/branding/logo/kubecloud-logo-single_writing_horizontal_color_300x112px.png" /></a>
<a href="https://www.redhat.com/fr/technologies/management/ansible"><img width="200" src="https://getvectorlogo.com/wp-content/uploads/2019/01/red-hat-ansible-vector-logo.png" /></a>
<a href="https://gradle.apache.org/"><img width="250" src="https://upload.wikimedia.org/wikipedia/fr/e/ed/Gradle_Logo.png" /></a>

# Supported Version

* Apache Gradle 3.x/4.x/5.x

# Supported OS

* CentOS 6/7
* RedHat 6/7
* Ubuntu Trusty/Xenial/Bionic
* Debian Jessie/Strech

# Depend On

* jetune.java

# Usage

* Install Role ``` ansible-galaxy install jetune.gradle ```
* use in your playbook
```
---
- hosts: all

  roles:
   - role: jetune.java
     vars:
      from_repo: false
      implementation: OPENJDK
      v_major: 11
      v_minor: 0.1
      build: 13
      os: linux
      arch: x64
      checksum: sha256:7a6bb980b9c91c478421f865087ad2d69086a0583aeeb9e69204785e8e97dcfd
      alternative_priority: 300
      is_default: true

   - role: jetune.gradle
     vars:
      v_major: 5
      v_minor: 5.1
      is_default: true


```
