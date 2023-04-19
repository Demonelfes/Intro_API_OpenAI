# ligne très importante qui appelle les gems.
require "http"
require "json"
require "pry"
require "dotenv"

Dotenv.load("../.env")
# n'oublie pas les lignes pour Dotenv ici…

# création de la clé d'api et indication de l'url utilisée.
# api_key = ENV["OPENAI_API_KEY"]
# url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

# # un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
# headers = {
#   "Content-Type" => "application/json",
#   "Authorization" => "Bearer #{api_key}"
# }

# # un peu de json pour envoyer des informations directement à l'API
# data = {
#   "prompt" => "5 parfums de glace",
#   "max_tokens" => 30,
#   "temperature" => 0.5
# }

# # une partie un peu plus complexe :
# # - cela permet d'envoyer les informations en json à ton url
# # - puis de récupéré la réponse puis de séléctionner spécifiquement le texte rendu
# response = HTTP.post(url, headers: headers, body: data.to_json)
# response_body = JSON.parse(response.body.to_s)
# response_string = response_body["choices"][0]["text"].strip

# # ligne qui permet d'envoyer l'information sur ton terminal
# puts "Voici 5 parfums de glace :"
# puts response_string

###
# require 'http'
# require 'dotenv'

# Dotenv.load('.env')
def login_openai
  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/models"
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }
  response = HTTP.get(url, headers: headers)
  return response
end

puts login_openai
#
#
# En gros, si ta connexion marche, c'est que la variable response ne sera pas égale à nil.
# Par exemple, si ta connexion marche, la ligne puts response
# devrait te ressortir un truc du genre énorme pavé avec des id,
# des objects, etc et nil si cela ne marche pas.
###
