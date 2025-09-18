# ==============================
# 1. CARREGAMENTO DE VARIÁVEIS DE AMBIENTE
# ==============================
[[ -f ~/.env.zsh ]] && source ~/.env.zsh

# ==============================
# 2. CONFIGURAÇÕES BÁSICAS
# ==============================
export EDITOR="${SSH_CONNECTION:+vim}"
export EDITOR="${EDITOR:-mvim}"

# ==============================
# 3. NVM (Node.js Version Manager)
# ==============================
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# ==============================
# 4. ZSH E OH-MY-ZSH
# ==============================
export ZSH="$HOME/.oh-my-zsh"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
  dotenv
  macos
  lighthouse
  z
  you-should-use
  colored-man-pages

)

[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# ==============================
# 5. ZINIT (Gerenciador de Plugins)
# ==============================
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
  echo "Instalando Zinit..."
  mkdir -p "$(dirname "$ZINIT_HOME")" && chmod g-rwX "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"
autoload -Uz _zinit && (( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# ==============================
# 6. FZF (Fuzzy Finder)
# ==============================
[[ -f ~/fzf-git.sh/fzf-git.sh ]] && source ~/fzf-git.sh/fzf-git.sh
eval "$(fzf --zsh)"

# ==============================
# 7. STARSHIP (Prompt)
# ==============================
eval "$(starship init zsh)"

# ==============================
# 8. AUTOCOMPLETION (Angular CLI)
# ==============================
if command -v ng &>/dev/null; then
  source <(ng completion script)
fi

# ==============================
# 9. CARREGAMENTO DE ALIASES E FUNÇÕES
# ==============================
[[ -f ~/.aliases.zsh ]] && source ~/.aliases.zsh
[[ -f ~/.docker_functions.zsh ]] && source ~/.docker_functions.zsh

# ==============================
# 10. FUNÇÕES ÚTEIS
# ==============================
facu() { cd ~/Development/projects/pos-graduacao; }
pwdcp() { pwd | tr -d '\n' | pbcopy; }

neofetch_info() { command -v neofetch &>/dev/null && neofetch || echo "neofetch não encontrado."; }
alias nf="neofetch_info"

# ==============================
# 11. FZF CUSTOM FUNCTIONS
# ==============================
_fzf_compgen_path() { fd --hidden --exclude .git . "$1"; }
_fzf_compgen_dir() { fd --type=d --hidden --exclude .git . "$1"; }
_fzf_comprun() {
  local command=$1; shift
  case "$command" in
    cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi" "$@" ;;
  esac
}

# ==============================
# 12. POWERLEVEL10K
# ==============================
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh




# Fim da configuração
