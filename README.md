andrewrothstein.kind
=========
![Build Status](https://github.com/andrewrothstein/ansible-kind/actions/workflows/build.yml/badge.svg)

Installs [kind](https://kind.sigs.k8s.io/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.kind
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
