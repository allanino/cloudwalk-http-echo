require "rubygems"
require "sinatra"

#Bound to this address so that external hosts can access it, VERY IMPORTANT!
set :bind, '0.0.0.0'

set :logging, true

get '/' do
  redirect "http://docs.cloudwalk.io"
end

post '/' do
  n = Random.rand(1...35)
  salt = rand(36**n).to_s(36) # Transform to base 27 + 9 for a-z0-9
  pi = "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091"
  if pi.include? params["buf"]
    "You're so stupid! It's not #{params["buf"]}, it's #{pi}... (not a repeating decimal)"
  else
    if params["anotherVariable"]
      salt + "#{params["buf"]} #{params["anotherVariable"]}"
    else
      salt + "#{params["buf"]}"
    end
  end
end
