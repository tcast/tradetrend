tradetrend
==========
#DEMO
If you'd like to see this project running you can go to our Heroku app located at

  http://trade-trend.herokuapp.com

<hr>
##RUN IT YOURSELF
If you choose to run this on your own machine , enter your Quandl AUTH-TOKEN as the following environmental variable
  <br>
  QUANDL__AUTH__TOKEN

<hr>
##API Resources/Data Sources
  Quandl


#Objective of the WebApp
Building relationships between stock price , P/E vs  the popularity(chatter , google trends) using multiple keywords.


*Stage-1*


Top ten highest traded(Most Active by Dollar Volume) stocks in the NYSE are evaluated.
Source:http://www.nasdaq.com/markets/most-active.aspx

expansion-
config.json:-array with stock symbols

classes:-
every class has an id , symbol name and keywords assosciated with it.
baseurl , appending url , etc.



