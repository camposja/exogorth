require 'httparty'
require 'json'
require 'awesome_print'

SWAPI = "http://swapi.co/api/"

response = HTTParty.get(SWAPI)

questions = JSON.parse(response.films)
endpoints = JSON.parse(response.body)


ap.questions
ap.questions["films"]

#week 3 day 1


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
