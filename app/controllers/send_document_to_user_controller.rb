class SendDocumentToUserController < ApplicationController
  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create

    if params[:telegram_user][:telegram_id].any?
        params[:telegram_user][:telegram_id].reject!(&:empty?)
    end

    require 'telegram/bot'

    @imagen = params[:document]

    array = params[:telegram_user][:telegram_id]


    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"

    array.each do |user|
      Telegram::Bot::Client.run(token) do |bot|
          @hola = TeleNotify::TelegramUser.find(user).telegram_id
            bot.api.send_document(chat_id: @hola, document: Faraday::UploadIO.new(@imagen, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'))
        end
    end
  end
end
