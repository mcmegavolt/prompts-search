require 'httparty'

url = "https://datasets-server.huggingface.co/first-rows?dataset=Gustavosta%2FStable-Diffusion-Prompts&config=default&split=test"

response = HTTParty.get(url)
data = JSON.parse(response.body)

Prompt.delete_all

data["rows"].each do |item|
  body = item["row"]["Prompt"]

  Prompt.create!(body: body)
end
