#language: pt

Funcionalidade: Criação do POST de relatorios da API

  Esquema do Cenario: Validar cenarios conhecidos da API de relatorios
    Dado que eu tenha os campos <data_nasc>, <nome> e <numero>
    Quando eu faço o POST na requisição relatórios
    Então a API deve retornar um <status_code>
    E a seguinte mensagem: <mensagem>

    Exemplos:
      | data_nasc    | nome               | numero        | status_code | mensagem                                                                                                                                                             |
      | ""           | ""                 | ""            | 400         | "É necessário enviar ao menos um parâmetro para criação do relatório."                                                                                               |
      | "28/09/1988" | "Gabriel Oliveira" | "07614917677" | 200         | "Inválido. [ERROR] Não foi possível validar: Data de nascimento informada está divergente da constante na base de dados da Secretaria da Receita Federal do Brasil." |
      | "25/05/1987" | "Gabriel Oliveira" | "07614917677" | 200         | "Inválido. [INVALID] Nome diferente do cadastrado na Receita Federal."                                                                                               |


  Esquema do Cenario: Validar cenarios não conhecidos da API de relatorios
    Dado que eu tenha os campos <data_nasc>, <nome> e <numero>
    Quando eu faço o POST na requisição relatórios
    Então a API deve retornar um <status_code>
    E a seguinte mensagem: <mensagem>

    Exemplos:
      | data_nasc    | nome                         | numero        | status_code | mensagem |
      | "19/07/1992" | "Vinicius Renovato da Silva" | "40325306885" | 200         | Válido.  |