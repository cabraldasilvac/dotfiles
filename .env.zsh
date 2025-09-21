# Variáveis de Ambiente
export PATH="$HOME/bin:/usr/local/bin:/usr/local/mysql/bin:/Users/wanderleycabral/.config/herd-lite/bin:/Users/wanderleycabral/Library/Application Support/Herd/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/wanderleycabral/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export HERD_PHP_83_INI_SCAN_DIR="/Users/wanderleycabral/Library/Application Support/Herd/config/php/83/"

# Configurações do FZF
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_OPTS="--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'

export BAT_THEME=tokyonight_night
