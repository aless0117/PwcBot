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

    id = "@PwC_Venezuela"



    token = "433749830:AAEhbBaPZIhZC5bGzmwwBZZ7NgzH5ZfcdCA"

    Telegram::Bot::Client.run(token) do |bot|
          bot.api.send_photo(chat_id: id, photo: Faraday::UploadIO.new(@imagen, 'image/jpeg'))
      end

  end
end
