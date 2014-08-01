###CRUD!!!
require 'net/http'

class Node
  
  # The initialize method is the constructor.  The @val is
  # an object value.
  def initialize(symbol,name,startdate,enddate)
    @symbol=symbol
    @name=name
    @date1=startdate
    @date2=enddate
    @APIFY_parser=nil
    puts symbol
  end

  def loadvalues()
  	if @APIFY_parser == nil
	  	@APIFY_parser=APIFY.new(self)
	end
	@APIFY_parser.parse()
  end

  def getter(num)
  	if num==0
  		puts "sending "+@date1
  		return @date1
  	elsif num==1
  		puts "sending "+@date2
  		return @date2
  	elsif num==2
  		return @symbol
  	end
  end

end

class APIFY
	@url_resource='http://www.quandl.com/api/v1/datasets/WIKI/'

	def initialize(obj)
		@API_KEY=ENV['QUANDL_AUTH_TOKEN']
		@inittime=obj.getter(0)
		@term=obj.getter(1)
		@symbol=obj.getter(2)
	end

	def parse()
		#puts @initme
		requestQUANDL()
		#return clean(requestQUANDL())

	end

	#Currently retrieves only the closing values
	def requestQUANDL()
		puts @inittime
		puts @term
		puts @symbol
		puts @API_KEY
		url=URI.parse('http://www.quandl.com/api/v1/datasets/WIKI/'+@symbol+'.json?auth_token='+@API_KEY+'&column=4&collapse=daily&sort_order=asc&trim_start='+@inittime+'&trim_end='+@term)
		puts url
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
	  			http.request(req)
				}
		puts res.body
		'''
		@req= Net::HTTP::Get.new(@url.to_s)
		@res=Net::HTTP.start(@url.port,@url.host) {|http|
			http.request(@req)
			}
		req = Net::HTTP::Get.new(@url.to_s)
		res = Net::HTTP.start(@url.host, @url.port) {|http|
  			http.request(@req)
			}
		puts res.body
		'''
	end

	def clean(values)
		return values
	end

end

def main
  apple=Node.new("AAPL","Apple","2013-02-21","2013-02-25")
  puts apple.instance_variable_get(:@API_KEY)
  apple.loadvalues()
end

main
