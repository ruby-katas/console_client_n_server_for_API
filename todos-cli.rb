require 'net/http'
require 'json'
require 'uri'

def list_tasks(email, token, host, path)
  uri = URI.parse("http://#{host}/#{path}.json")
  http = Net::HTTP.new(uri.host, uri.port)

  headers = {
    "x-User-Token" => token,
    "x-User-Email" => email,
    "Accept" => "application/json",
    "content-type" => "application/json"
  }

  response = http.get(uri.path, headers)
  tasks = JSON.parse (response.body)

  tasks.each do |t|
    puts "#{t['id']} [#{t['status']}] #{t['description']}"
  end
end

email = ARGV[0]
token = ARGV[1]
host = ARGV[2]
path = ARGV[3]

list_tasks(email, token, host, path)


