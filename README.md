# Dotfiles

## Install dotfiles

1. Place vault secret password at ~/.ansible/vault.secret 
2. Run dotfiles script
```bash 
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aasalim/ansible/main/sdotfiles)"
```

3. Run ssh-agent and add SSH keys
```bash
eval $(ssh-agent -s) && ssh-add ~/.ssh/dotfiles
```

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aasalim/ansible/main/sdotfiles)" && eval $(ssh-agent -s) && ssh-add ~/.ssh/dotfiles
```





