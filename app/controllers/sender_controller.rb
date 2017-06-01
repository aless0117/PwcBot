class SenderController < ApplicationController

    def index
      @telegramusers= TeleNotify::TelegramUser.all

      @messages = Message.all
    end


  def create

    @hola=params[:message]

    require "uri"
    require "net/http"
    require 'net/http/post/multipart'



    id = "@pruebadelcanal"


    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"


    params = {'chat_id' => id,
    'text' => @hola
    }
    @x = Net::HTTP.post_form(URI.parse("https://api.telegram.org/bot" + token + "/sendMessage"), params)

  end


end
