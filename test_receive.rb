require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/sms' do
  sender = params[:From]
  friends = {
    "+17347470675" => "Brother Yang",
    "+14158157775" => "Boots",
    "+14155551234" => "Virgil"
  }
  content = params[:Body]
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hello, #{name}. Thanks for the message #{content}"
  end
  twiml.text
end