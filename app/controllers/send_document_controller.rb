class SendDocumentController < ApplicationController
  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create


    @imagen = params[:document]


    require "uri"
    require "net/http"


    require 'telegram/bot'

    id = "@PwC_Venezuela"



    token = "433749830:AAEhbBaPZIhZC5bGzmwwBZZ7NgzH5ZfcdCA"

    Telegram::Bot::Client.run(token) do |bot|
          bot.api.send_document(chat_id: id, document: Faraday::UploadIO.new(@imagen, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'))
      end

  end
end
