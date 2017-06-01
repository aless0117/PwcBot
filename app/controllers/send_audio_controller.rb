class SendAudioController < ApplicationController
  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create


    @imagen = params[:audio]


    require "uri"
    require "net/http"


    require 'telegram/bot'

    id = "332541532l"


    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"


    Telegram::Bot::Client.run(token) do |bot|

          bot.api.send_audio(chat_id: id, audio: Faraday::UploadIO.new(@imagen, 'audio/mp3'))

      end

  end
end
