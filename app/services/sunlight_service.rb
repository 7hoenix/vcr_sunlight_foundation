class SunlightService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://congress.api.sunlightfoundation.com")
    connection.query[:apikey] = "a85ea01c31264bae8f43bbdc3826f69c"
  end

  def legislators(params)
    parse(connection.get("legislators", params))[:results]
  end

  def committees(params)
    parse(connection.get("committees", params))[:results]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
