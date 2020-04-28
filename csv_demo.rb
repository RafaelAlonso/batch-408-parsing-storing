require 'csv'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

# Parsing CSV
beers = []
CSV.foreach(filepath, csv_options) do |linha|
  # cada linha é uma hash (CSV::Row)
  beers << linha
end

alumni_beers = [
  {name: 'Munich', appearance: 'pielsen', origin: 'paraguay'},
  {name: 'Stella', appearance: 'clara', origin: 'Belgium'},
  {name: 'Leffe', appearance: 'blond', origin: 'Belgium' }
]


# Storing CSV
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', "Appearance", "Origin"]

  # adicionando nossas próprias cervejas
  alumni_beers.each do |beer|
    beer_name = beer[:name]
    beer_appearence = beer[:appearance]
    beer_origin = beer[:origin]
    csv << [beer_name, beer_appearence, beer_origin]
  end

  # adicionando todas as outras cervejas do arquivo
  beers.each do |beer|
    csv << [beer["Name"], beer["Appearance"], beer["Origin"]]
  end
end
