Dado("que eu tenha os campos {string}, {string} e {string}") do |data_nasc, nome, numero|
  @template = $post_relatorios.create_json(data_nasc, nome, numero)
end

Quando("eu faço o POST na requisição relatórios") do
  @response_post = $post_relatorios.post_relatorios @template
end

Então("a API deve retornar um {int}") do |status_code|
  expect(@response_post.code).to eq status_code
end

Então("a seguinte mensagem: {string}") do |mensagem|
    expect(@response_post["message"]).to eq mensagem
end

Então("gerar o um protocolo de cadastro") do
  puts 'O protocolo de criação: ' + @response_post["result"]["numero"] + ' foi gravado em um arquivo na pasta raiz do projeto.'
  open('Formulário de protocolos.txt', 'a') do |f|
    f << "#{@response_post["result"]["numero"]}\n"
  end
end
