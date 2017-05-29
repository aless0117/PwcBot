class SendImageController < ApplicationController
  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


def create

  @hola=params[:message]
  @imagen= File.open(params[:photo])

  require "uri"
  require "net/http"
  require 'net/http/post/multipart'


  id = "332541532l"

  token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"

  files = {'photo'=> @imagen}

  params = {'chat_id' => id}

  @x = Net::HTTP.Post::Multipart.new(URI.parse("https://api.telegram.org/bot" + token + "/sendPhoto"), params, files)

end
end
