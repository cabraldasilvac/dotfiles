#!/bin/bash

# install.sh - Instala dotfiles com repositório bare
# Uso: curl -fsSL https://exemplo.com/install.sh | bash

echo "🚀 Iniciando instalação dos dotfiles..."

# Definir alias temporário para o repositório bare
dotfiles() {
    git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
}

# URL do seu repositório (altere para o seu!)
REPO_URL="https://github.com/cabraldasilvac/dotfiles.git"

# Diretório de backup para arquivos locais que entrarem em conflito
BACKUP_DIR="$HOME/.dotfiles-backup"

# Clonar o repositório bare (sem afetar arquivos locais ainda)
if git clone --bare "$REPO_URL" "$HOME/.dotfiles" 2>/dev/null; then
    echo "✅ Repositório clonado com sucesso."
else
    echo "⚠️  Repositório já existe. Atualizando..."
    dotfiles fetch --all
fi

# Fazer checkout dos arquivos
if dotfiles checkout; then
    echo "✅ Todos os arquivos foram restaurados!"
else
    echo "📁 Detectados arquivos locais que conflitam. Fazendo backup..."

    # Criar diretório de backup
    mkdir -p "$BACKUP_DIR"
    echo "📦 Movendo arquivos conflitantes para $BACKUP_DIR"

    # Listar arquivos que causam conflito e mover para backup
    dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I {} sh -c '
        mkdir -p "'"${BACKUP_DIR}"'$(dirname "{}")"
        mv "{}" "'"${BACKUP_DIR}"'{}" 2>/dev/null || true
    '

    # Tentar novamente o checkout
    if dotfiles checkout; then
        echo "✅ Checkout concluído após backup!"
    else
        echo "❌ Erro ao aplicar checkout mesmo após backup."
        exit 1
    fi
fi

# Configurar Git para não mostrar arquivos não rastreados
dotfiles config --local status.showUntrackedFiles no

# Recarregar shell se .zshrc ou .bashrc foi instalado
if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
    echo "🔁 Zsh recarregado."
elif [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
    echo "🔁 Bash recarregado."
fi

echo "🎉 Instalação concluída com sucesso!"
echo "💡 Dica: Use 'dotfiles status' para verificar o estado dos arquivos."   
