Dado("que eu tenha os campos {string}, {string} e {string}") do |data_nasc, nome, numero|
  @template = $post_relatorios.create_json(data_nasc, nome, numero)
end

Quando("eu faço o POST na requisição relatórios") do
  @response = $post_relatorios.post_relatorios @template
end

Então("a API deve retornar um {int}") do |status_code|
  expect(@response.code).to eq status_code
end

Então("a seguinte mensagem: {string}") do |mensagem|
  if @response.code == 400
    expect(@response["message"]).to eq mensagem
  elsif @response.code == 200
    expect(@response["result"]["mensagem"]).to eq mensagem
  end
end
