# Configuração do Neovim com LazyVim
:)
Minha configuração atual do nvim com LazyVim

## Requisitos

- **Neovim 0.10+**: A configuração SÓ funciona em uma versão maior que 0.10, se tentar em uma anterior NÃO vai funcionar


## Instalação

Como usar:

1. **Clone o repositório para o diretório de configuração do Neovim**:

    ```bash
    git clone https://github.com/nominalism/nvim-config.git ~/.config/nvim
    ```

    Se já tiver uma configuração anterior no `~/.config/nvim`, você pode fazer um backup antes de clonar.

2. **Instale as dependências do Neovim**:

    Depois de clonar automaticamente o LazyVim vai sincronizar tudo, só abrir o nvim

    ```bash
    nvim
    ```


## Comandos principais

- **LazyVim** para ver todos os plugins rode:

    ```
    :Lazy
    ```

    Isso abrirá a interface do LazyVim para gerenciar, atualizar ou instalar novos plugins.

- **O que você mais vai usar**:
    - `:Lazy sync` — Sincroniza os plugins e garante que tudo esteja atualizado.
    - `:Lazy update` — Atualiza todos os plugins instalados.
    - `:Lazy install` — Instala os plugins ausentes.

## Alterações

Para mudar as configurações só ir em `~/.config/nvim/lua/` e instalar outras dependências ou modificar as existentes, estão todas em arquivos separados para facilitar adicionar e remover elas
