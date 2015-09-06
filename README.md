# Ansible MySQL Role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-apache2.svg)](https://travis-ci.org/weareinteractive/ansible-apache2)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.supervisor-blue.svg)](https://galaxy.ansible.com/list#/roles/)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-apache2.svg)](https://github.com/weareinteractive/ansible-apache2)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-apache2.svg)](https://github.com/weareinteractive/ansible-apache2)

> `mysql` is an [ansible](http://www.ansible.com) role which:
>
> * installs mysql
> * configures mysql
> * manages databases
> * manages users

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.mysql
```

Using `requirements.yml`:

```
- src: franklinkim.mysql
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-mysql.git franklinkim.mysql
```

## Dependencies

* Ansible >= 1.9

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
# mysql_databases:
#   - name: db1
#   - name: db2
#       encoding: utf8
#     collation: utf8_general_ci
#   - name: db3
#     state: absent
#
# mysql_users:
#   - name: user1
#   - name: user2
#     priv: *.*:ALL
#       password: secret
#   - name: user3
#     state: absent
#

# packages name (versions)
mysql_packages:
  - mysql-server
  - mysql-client
  - python-mysqldb
# start on boot
mysql_service_enabled: yes
# current state: started, stopped
mysql_service_state: started

# Basic settings
mysql_port: 3306
mysql_bind_address: "0.0.0.0"
mysql_root_password: 'pass'
mysql_language: '/usr/share/mysql/'

# Fine Tuning
mysql_key_buffer: '16M'
mysql_max_allowed_packet: '128M'
mysql_thread_stack: '192K'
mysql_cache_size: 8
mysql_myisam_recover: 'BACKUP'
mysql_max_connections: 100
mysql_table_cache: 64
mysql_thread_concurrency: 10
mysql_query_cache_limit: '1M'
mysql_query_cache_size: '16M'
mysql_innodb_file_per_table: 'innodb_file_per_table'
mysql_character_set_server: 'utf8'
mysql_collation_server: 'utf8_general_ci'
mysql_mysqldump_max_allowed_packet: '128M'
mysql_isamchk_key_buffer: '16M'

# InnoDB tuning
mysql_innodb_file_per_table: 'innodb_file_per_table'
mysql_innodb_flush_method: 'fdatasync'
mysql_innodb_buffer_pool_size: '128M'
mysql_innodb_flush_log_at_trx_commit: 1
mysql_innodb_lock_wait_timeout: 50
mysql_innodb_log_buffer_size: '1M'
mysql_innodb_log_file_size: '5M'

# List of databases to be created
mysql_databases: []

# List of users to be created
mysql_users: []
```

## Example playbook

```
- hosts: all
  sudo: yes
  roles:
    - franklinkim.mysql
  vars:
    mysql_databases:
      - name: db1
      - name: db2
        encoding: utf8
        collation: utf8_general_ci
      - name: db3
        state: absent
    mysql_users:
      - name: user1
      - name: user2
        priv: *.*:ALL
        password: secret
      - name: user3
        state: absent
```

## Testing

```
$ git clone https://github.com/weareinteractive/ansible-mysql.git
$ cd ansible-mysql
$ vagrant up
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.
