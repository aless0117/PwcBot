class SendVideoController < ApplicationController

  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create


    @imagen = params[:video]


    require "uri"
    require "net/http"


    require 'telegram/bot'

    id = "@pruebadelcanal"



    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"


    Telegram::Bot::Client.run(token) do |bot|

          bot.api.send_video(chat_id: id, video: Faraday::UploadIO.new(@imagen, 'video/mp4'))

      end

  end

end
