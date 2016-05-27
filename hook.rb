#nohup ruby hook.rb -o 0.0.0.0 &

require 'sinatra'
require 'json'
require 'logger'

set :port, 80

get '/' do
  '...'
end

post '/hook' do
  logger = Logger.new('logfile.log')
  logger.level = Logger::DEBUG
  body = JSON.parse(request.body.read)
  logger.debug(event: body, sift_signature: request.env["HTTP_X_SIFT_SCIENCE_SIGNATURE"])
end