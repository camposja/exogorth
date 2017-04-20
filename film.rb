require 'httparty'
require 'json'
require 'ap'

dark_side = HTTParty.get("http://swapi.co/api/")

questions = JSON.parse(dark_side.films)
ap.questions
ap.questions["films"]


# class MoneyExchanger
#   def convert(amount, currency, from = "USD")
#     response = HTTParty.get("https://swapi.co/", { query: { base: from } })
#
#     if response.code == 200
#       exchange_data = JSON.parse(response.body)
#
#       rates = exchange_data["rates"]
#
#       rate = rates[currency]
#
#       return amount * rate
#     end
#   end
# end
#
# exchanger = MoneyExchanger.new
# amount = 5_000
#
# amount_in_cad = exchanger.convert(amount, "CAD")
# amount_in_gbp = exchanger.convert(amount, "GBP")
# puts "#{amount} in CAD is #{amount_in_cad}"
# puts "#{amount} in GBP is #{amount_in_gbp}"
