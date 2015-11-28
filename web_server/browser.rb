require 'socket'
require 'json'

def do_GET(path)
  "GET #{path} HTTP/1.0\r\n\r\n"
end

def do_POST(path)
  hsh = Hash.new
  puts "Viking name?"
  name = gets.chomp
  puts "Viking email?"
  email = gets.chomp
  hsh = {:viking => {:name => name, :email => email}}
  to_send = hsh.to_json
  "POST #{path} HTTP/1.0\nContent-Length: #{to_send.size}\r\n\r\n#{to_send}"
end

host = 'localhost'
port = 2000
path = "/thanks.html"
request = ""

puts "Do you want to GET or POST?"
user_input = gets.chomp

case user_input
when "GET"
  request = do_GET(path)
when "POST"
  request = do_POST(path)
end

socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read
print response

# headers,body = response.split("\r\n\r\n", 2)
# print body