module CyprusPostalCodes
  class Address < Client
    #@client.connection.get("addresses", {postal_code: 1055}, {Authorization: @client.api_key}).body

    def call(params)
      connection.get('addresses', params)
    end
  end
end
