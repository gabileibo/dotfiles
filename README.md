# Dotfiles


## Stow 

### zshrc

```
stow --target $HOME zshrc
```

### k9s

```
stow --target $HOME k9s
```

### starship

```
stow --target $HOME starship
```

### gitconfig

```
export EMAIL=<your-email@example.com>
envsubst < gitconfig/.gitconfig.tmpl > gitconfig/.gitconfig 
stow --target $HOME --ignore='.gitconfig.tmpl' gitconfig
```
