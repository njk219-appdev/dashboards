class CurrencyController < ApplicationController
  def first_currency
    @rawdata = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@rawdata)
    symbolshash = @parsed_data.fetch("symbols")
    @array_of_symbols = symbolshash.keys
    
    render({:template => "currency_templates/step_one.html.erb"})
  end
  def other_currency
    @rawdata = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@rawdata)
    symbolshash = @parsed_data.fetch("symbols")
    @array_of_symbols = symbolshash.keys
    
    #params are
    #Parameters: {"from_currency"=>"ARS"}

    @from_symbol = params.fetch("from_currency")

    render({:template => "currency_templates/step_two.html.erb"})
  end
  def convert_currency
    @rawdata = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@rawdata)
    symbolshash = @parsed_data.fetch("symbols")
    @array_of_symbols = symbolshash.keys
    
    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")

    @rawexchange = open("https://api.exchangerate.host/convert?from=" + @from_symbol + "&to=" + @to_symbol).read
    @parsed_exchange = JSON.parse(@rawexchange)
    @rate = @parsed_exchange.fetch("result")

    render({:template => "currency_templates/step_three.html.erb"})
  end
end
