class SendVideoToUserController < ApplicationController
  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create

    if params[:telegram_user][:telegram_id].any?
        params[:telegram_user][:telegram_id].reject!(&:empty?)
    end

    require 'telegram/bot'

    @imagen = params[:video]

    array = params[:telegram_user][:telegram_id]


    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"

    array.each do |user|
      Telegram::Bot::Client.run(token) do |bot|

          @hola = TeleNotify::TelegramUser.find(user).telegram_id

            bot.api.send_video(chat_id: @hola, video: Faraday::UploadIO.new(@imagen, 'video/mp4'))

        end
    end



  end
end
