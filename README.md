# Meus DotFiles

Este repositório contém meus arquivos de configuração pessoal (dotfiles) para diversas ferramentas e ambientes.

## Conteúdo

- `.aliases.zsh`: Aliases personalizados para o Zsh.
- `.bashrc`: Configurações do Bash.
- `.docker_functions.zsh`: Funções personalizadas para o Docker no Zsh.
- `.env.zsh`: Variáveis de ambiente para o Zsh.
- `.gitconfig`: Configurações do Git.
- `.gitignore`: Regras de arquivos ignorados para projetos locais.
- `.gitignore_global`: Regras de arquivos ignorados para todos os projetos Git.
- `.tmux.conf`: Configurações do Tmux.
- `.zprofile`: Configurações de perfil do Zsh.
- `.zshrc`: Configurações do Zsh.
- `.fzf.zsh`: Configurações do fzf.zsh.
- `spacesship.zsh`: Configurações da linha de comando do spaceship.
- `starship.toml`: Configurações do starship.

- `.config/alacritty/alacritty.toml`: Configurações do terminal Alacritty.
- `.config/htop/htoprc`: Configurações do Htop.
- `.config/neofetch`: Configurações do Neofetch.
- `.config/nvim`: Configurações do Neovim lua.
- `.config/Presets_iterm_colors/`: Configurações de presets do terminal.
- `.config/tmuxinator`: Configurações do Emulador de terminal tmuxinator.

## Instalação

1.  Clone este repositório para o seu diretório home:

    ```bash
    git clone <URL_DO_SEU_REPOSITÓRIO> ~/.dotfiles
    ```

2.  Crie links simbólicos para os arquivos de configuração:

    ```bash
    ln -s ~/.dotfiles/.aliases.zsh ~/.aliases.zsh
    ln -s ~/.dotfiles/.bashrc ~/.bashrc
    ln -s ~/.dotfiles/.docker_functions.zsh ~/.docker_functions.zsh
    ln -s ~/.dotfiles/.env.zsh ~/.env.zsh
    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.gitignore ~/.gitignore
    ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/.zprofile ~/.zprofile
    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ```

3.  Reinicie o shell ou abra um novo terminal para que as alterações entrem em vigor.

## Personalização

Sinta-se à vontade para modificar os arquivos de configuração de acordo com suas preferências.

## Contribuição

Contribuições são bem-vindas! Se você tiver alguma sugestão ou melhoria, abra uma issue ou envie um pull request.

## Licença

Este projeto é licenciado sob a Licença MIT.
