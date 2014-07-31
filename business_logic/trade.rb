###CRUD!!!
require 'net/http'


class Node
  
  # The initialize method is the constructor.  The @val is
  # an object value.
  def initialize(symbol,name)
    @symbol=symbol
    @name=name
    @APIFY_parser=APIFY.new(self)
    
  end

  def loadvalues()
  	@node_data=@APIFY_parser.parse(se)
  end

end

class APIFY
	@url_resource='http://www.quandl.com/api/v1/datasets/WIKI/'

	def initialize(obj)
		if num==1 then
			@status="Initialized elsewhere"
		else
			@status="Manual Initialize"
		end
		@API_KEY=ENV['QUANDL_AUTH_TOKEN']
		@symbol=obj.instance_variable_get(:@symbol)
	end

	def parse(obj)
		requestQUANDL()
		#return clean(requestQUANDL())

	end

	#Currently retrieves only the closing values
	def requestQUANDL()
		@url_resource='http://www.quandl.com/api/v1/datasets/WIKI/'+@symbol+'.json?'+@API_KEY+'&column=4'
		puts @url_resource	
	end

	def clean(values)
		return values

end

def main
  apple=Node.new("AAPL","Apple")
  puts apple.instance_variable_get(:@API_KEY)
  apple.loadvalues()
end

main
