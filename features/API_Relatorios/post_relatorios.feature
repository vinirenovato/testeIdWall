#language: pt

Funcionalidade: Criação do POST de relatorios da API

  Esquema do Cenario: Validar cenarios invalido da API de relatorios
    Dado que eu tenha os campos <data_nasc>, <nome> e <numero>
    Quando eu faço o POST na requisição relatórios
    Então a API deve retornar um <status_code>
    E a seguinte mensagem: <mensagem>

    Exemplos:
      | data_nasc    | nome               | numero        | status_code | mensagem                                                                                                                                                             |
      | ""           | ""                 | ""            | 400         | "É necessário enviar ao menos um parâmetro para criação do relatório."                                                                                               |

  Esquema do Cenario: Validar cenarios com erros da API de relatorios
    Dado que eu tenha os campos <data_nasc>, <nome> e <numero>
    Quando eu faço o POST na requisição relatórios
    Então a API deve retornar um <status_code>
    E gerar o um protocolo de cadastro

    Exemplos:
      | data_nasc    | nome               | numero        | status_code |
      | "28/09/1988" | "Gabriel Oliveira" | "07614917677" | 200         |
      | "25/05/1987" | "Gabriel Oliveira" | "07614917677" | 200         |

  Esquema do Cenario: Validar cenarios sem erros da API de relatorios
    Dado que eu tenha os campos <data_nasc>, <nome> e <numero>
    Quando eu faço o POST na requisição relatórios
    Então a API deve retornar um <status_code>
    E gerar o um protocolo de cadastro  

    Exemplos:
      | data_nasc    | nome                         | numero        | status_code |
      | "19/07/1992" | "Vinicius Renovato da Silva" | "40325306885" | 200         |