require 'socket'
require 'json'

def do_GET(client, path)
  if File.exist?(path)
    File.open(path, "r") do |file|
      client.print "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: text/plain\r\n" +
                   "Content-Length: #{file.size}\r\n" +
                   "Connection: close\r\n"
      client.print "\r\n"

      client.puts(file.readlines.join)
    end
  else
    client.print "HTTP/1.0 404 Not Found\r\n" +
                 "\r\n" +
                 "Requested page not found!"
  end
end

def do_POST(client, path, params)
  if File.exist?(path)
    hash = JSON.parse(params)
    html = sub_html(hash)
    client.print "HTTP/1.1 200 OK\r\n" +
                 "\r\n" +
                 html
  else
    client.print "HTTP/1.0 404 Not Found\r\n" +
                 "\r\n" +
                 "POST request - cannot find file!"
  end
end

def sub_html(params)
  file = "./thanks.html"
  html = File.read(file)
  insert_html = ""
  params.values.each { |val| val.each { |k, v| insert_html += "<li>#{k.capitalize}: #{v}</li>"} }
  html.gsub("<%= yield %>", insert_html)
end

server = TCPServer.open(2000)

loop {
  client = server.accept
  request = client.recv(1000).split("\r\n\r\n")
  header = request.first.split("\n")
  body = request.last
  action = header[0].split[0]
  path = ".#{header[0].split[1]}"

  case action
  when "GET"
    do_GET(client, path)
  when "POST"
    do_POST(client, path, body)
  end

  client.close
}