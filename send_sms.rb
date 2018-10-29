require 'messagebird'

# Load and initialize MesageBird SDK
client = MessageBird::Client.new('YOUR-API-KEY')

begin
  response = client.message_create(
    '31970XXXXXXX',
    ['31970YYYYYYY'],
    'Hello World, I am a text message and I was hatched by Ruby code!'
  )
  puts 'SUCCESS'
  puts response
rescue MessageBird::ErrorException => ex
  errors = ex.errors.each_with_object([]) do |error, memo|
    memo << "Error code #{error.code}: #{error.description}"
  end.join("\n")
  puts 'ERROR'
  puts errors
end
