class SendImageController < ApplicationController
  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create


    @imagen = params[:photo]


    require "uri"
    require "net/http"


    require 'telegram/bot'

    id = "@pruebadelcanal"



    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"


    Telegram::Bot::Client.run(token) do |bot|

          bot.api.send_photo(chat_id: id, photo: Faraday::UploadIO.new(@imagen, 'image/jpeg'))

      end




  end
end
