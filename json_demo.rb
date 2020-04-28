require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

# Parsing JSON
serialized_file = File.read(filepath)
file_as_object = JSON.parse(serialized_file)
# file_as_object é uma Hash
# file_as_object["beers"] é uma Array de Hashes
# file_as_object["beers"][2] é a terceira Hash
# file_as_object["beers"][2]["appearance"] é ???
p file_as_object["beers"][2]["appearance"]

# objetivo: pegar a origem da Cuvée des Trolls
# passar por cada cerveja
# verificar se o nome dela é Cuvée des Trolls
# mostrar a origem caso seja
file_as_object["beers"].each do |beer|
  # beer é uma hash com as chaves name, appearence e origin
  if beer["name"] == "Cuvée des Trolls"
    puts beer["origin"]
  end
end

# Storing JSON

alumni_beers = [
  {name: 'Munich', appearance: 'pielsen', origin: 'paraguay'},
  {name: 'Stella', appearance: 'clara', origin: 'Belgium'},
  {name: 'Leffe', appearance: 'blond', origin: 'Belgium' }
]

alumni_beers.each do |beer|
  # file_as_object["beers"] é uma Array de Hashes
  # beer é uma Hash
  file_as_object["beers"] << beer
end

File.open('data/beers2.json', 'wb') do |file|
  file.write(JSON.generate(file_as_object))
end






















