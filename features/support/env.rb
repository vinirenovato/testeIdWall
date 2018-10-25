require 'rspec'
require 'page-object'
require 'data_magic'
require 'httparty'
require 'byebug'


Before do
  $post_relatorios = PostRelatorios.new
end
