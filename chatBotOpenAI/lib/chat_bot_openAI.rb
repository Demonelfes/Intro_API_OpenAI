# ligne très importante qui appelle les gems.
require "http"
require "json"
require "pry"
require "dotenv"

Dotenv.load("../.env")
# n'oublie pas les lignes pour Dotenv ici…

def perform
  # création de la clé d'api et indication de l'url utilisée.
  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/engines/text-davinci-003/completions"

  # un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }

  conv_history = ""
  # un peu de json pour envoyer des informations directement à l'API
  loop do
    input = gets.chomp
    break if input == "exit"
    conv_history += input
    data = {
      "prompt" => conv_history,
      "max_tokens" => 250,
      "n" => 1,
      "temperature" => 0
    }
    response = HTTP.post(url, headers: headers, body: data.to_json)
    response_body = JSON.parse(response.body.to_s)
    response_string = response_body["choices"][0]["text"].strip

    conv_history += response_string

    puts "bot : #{response_string}"
  end
end

perform
