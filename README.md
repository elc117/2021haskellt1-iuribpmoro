# Geração de Imagens

## Apresentação:
O presente algoritmo, desenvolvido em Haskell, gera imagens SVG com círculos ou retângulos de mesma origem, com tamanhos decrescentes. Dessa forma, o programa recebe do usuário a opção desejada, junto do número de elementos a serem gerados e o tamanho da figura principal.


## Modo de Uso:
- Primeiramente, abra o arquivo Main.hs por meio do uso da ferramenta ghci:
  - ```ghci Main.hs```
- Chame a função generate, passando como argumentos, respectivamente:
  - Opção desejada;
    - 1 = Círculos
    - 2 = Retângulos
  - Número de elementos;
  - Largura da figura principal;
  - Altura da figura principal;
    - Para a opção 2, insira um número qualquer para a altura, o raio levará em consideração o valor passado como largura.

### Exemplo:
```bash
# Main.hs <OPÇÃO> <NUM_ELEMENTOS> <WIDTH> <HEIGHT>
$ ghci Main.hs
*Main> generate 2 100 1000 1000 # Gera 100 retângulos de mesma origem, com largura 1000 e altura 1000.
```

## Imagens Geradas:
Algumas imagens geradas pelo programa estão disponíveis na pasta ["Imagens"](https://github.com/elc117/2021haskellt1-iuribpmoro/tree/master/Imagens) do repositório.


## Autor

### Iuri Moro
[![Gmail Badge](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white
)](mailto:iuribpmoro@gmail.com)[![Linkedin Badge](https://img.shields.io/badge/linkedin%20-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/iuribpmoro/)
