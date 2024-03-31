# Dotfiles


## Templates 

### gitconfig 
```
export EMAIL=<your-email@example.com>
envsubst < _templates/gitconfig/.gitconfig.tmpl > gitconfig/.gitconfig 
```

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
stow --target $HOME --ignore='\.gitkeep' gitconfig
```
