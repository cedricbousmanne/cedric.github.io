require 'sinatra'

post '/update-webmentions' do
  system('./run.sh')
  "Hello World!"
end
