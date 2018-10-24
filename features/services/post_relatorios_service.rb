class PostRelatorios

  include HTTParty

  headers 'Content-Type' => 'application/json',
          'Authorization' => '9a5c457e-d004-46d2-ad0b-b3f015af0c58'

  base_uri 'https://api-v2.idwall.co'

  def post_relatorios(template)
    self.class.post('/relatorios',:body => template.to_json)
  end

  def create_json(data_nasc, nome, numero)
    template = YAML.load_file("features/templates/post_relatorios.yml")
    template["parametros"]["cpf_data_de_nascimento"] = data_nasc
    template["parametros"]["cpf_nome"] = nome
    template["parametros"]["cpf_numero"] = numero
    template
  end

end
