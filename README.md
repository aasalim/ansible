# Dotfiles
Fully automated development environment for Ahmed Salim.

## Goals

Provide fully automated `Ubuntu` development environment that is easy to set up and maintain. 

### Why Ansible?

Ansible replicates what we would do to set up a development environment.

## Requirements

### Operating System

This Ansible playbook only supports `Ubuntu` distribution.

## Setup

### all.yml

The `all.yml` file allows you to personalize your setup to your needs.

ssk_key
git_user_email
git_user_name
bash_public
bash_private

#### Environment

Manage environment variables by configuring the `bash_public` and `bash_private` values in `all.yaml`. See both values usecase below.

##### bash_public

The `bash_public` value allows you to include a dictionary of generic and unsecure key-value pairs that will be stored in a `~/.bash_public`.

```yaml

---
bash_public:
  MY_ENV_VAR: something
```

#### bash_private

The `bash_private` value allows you to include a dictionary of secure key-value pairs that will be stored in a `~/.bash_private`.

```yaml

---
bash_private:
  MY_ENV_VAR_SECRET: !vault |
    $ANSIBLE_VAULT;1.1;AES256
    62333533626436313366316235626561626635396233303730343332666466393561346462303163
    3666623049823049823049823409238537323136646137630a336332303030323031376164316562
    65333963633339323382938472963720394820394820935720397520947203489230984290307502
    3830376265316231630a623834333061393138306331653164626437623337366165636163306237
    3437
```
### vault.secret

The `vault.secret` file allows you to encrypt values with `Ansible vault` and store them securely. Create a file located at `~/.ansible/vault.secret` with a secure password in it.

To then encrypt values with your vault password use the following:

```bash
$ ansible-vault encrypt_string --vault-password-file $HOME/.ansible/vault.secret "mynewsecret" --name "MY_SECRET_VAR"
$ cat myfile.conf | ansible-vault encrypt_string --vault-password-file $HOME/.ansible/vault.secret --stdin-name "myfile"
```

> NOTE: This file will automatically be detected by the playbook when running `dotfiles` command to decrypt values. 


## # Install dotfiles

1. Place vault secret password at ~/.ansible/vault.secret 
2. Run dotfiles script
```bash 
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aasalim/ansible/main/sdotfiles)"
```

3. Run ssh-agent and add SSH keys
```bash
eval $(ssh-agent -s) && ssh-add ~/.ssh/dotfiles
```
#### Oneliner
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aasalim/ansible/main/sdotfiles)" && eval $(ssh-agent -s) && ssh-add ~/.ssh/dotfiles
```





