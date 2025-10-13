Detalhamento da Funcionalidade
O código é uma lógica adaptada de plugins como o nvim-lastplace e é projetado para melhorar a continuidade da sua experiência de edição.

1. Gatilho (Autocomando)
O bloco final cria um Autocomando que executa a função run() em dois eventos:

BufWinEnter: Dispara quando um buffer existente é exibido em uma janela. Este é o momento crucial para restaurar o cursor.

FileType: Dispara quando o tipo de arquivo (filetype) é detectado.

2. Condições de Ignorar
A função run() começa definindo exceções para evitar a restauração do cursor em buffers que geralmente não se beneficiam disso:

ignore_buftype: Ignora buffers especiais como:

quickfix (lista de erros/busca)

nofile (buffers que não correspondem a um arquivo real)

help (arquivos de ajuda do Vim)

terminal (janelas de terminal integradas)

ignore_filetype: Ignora buffers relacionados a commits de Git e Mercurial, onde geralmente se espera que o cursor comece na primeira linha.

Ação para estes: Se o tipo de arquivo for um desses, ele executa vim.cmd([[normal! gg]]), forçando o cursor a ir para a primeira linha.

3. Lógica da Posição
Se o buffer não for ignorado, o código tenta restaurar o cursor com base em uma marca interna do Vim:

A Marca ": O Vim/Neovim mantém uma marca chamada " (aspas duplas) que armazena a última posição de saída (exit position) do buffer quando você o fecha.

local last_line = vim.fn.line([['"]]): Obtém o número da linha da última posição de saída ('"). Se for > 0, significa que o Neovim tem uma posição válida para restaurar.

Restauração e Centralização: Se a posição for válida e dentro dos limites do arquivo, o código:

Restaura o cursor para a última linha salva: vim.cmd([[normal! g"]])`.

Em seguida, tenta centralizar a visualização para que a linha restaurada fique visível no meio da tela (zz) ou, em outros casos, ajusta a tela para cima ou para baixo (G'"<c-e>) para garantir que o contexto de edição seja claro.

Em resumo, este código proporciona um uso mais eficiente do Neovim ao evitar que você precise rolar manualmente para encontrar onde parou a última vez que abriu um arquivo. 🚀#
