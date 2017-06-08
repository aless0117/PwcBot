class SenderUserController < ApplicationController

  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create

  #ELIMINO LOS ESPACIOS EN BLANCO DEL ARRAY
    if params[:telegram_user][:telegram_id].any?
        params[:telegram_user][:telegram_id].reject!(&:empty?)
    end
    if params[:event][:event_id].any?
        params[:event][:event_id].reject!(&:empty?)
    end

  #VARIABLES
    @hola=params[:message]
    array = params[:telegram_user][:telegram_id]
    array2 = params[:event][:event_id]
    token = "366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA"

  #ENVIO DEL MENSAJE A GRUPOS
    array2.each do |event|
      Telegram::Bot::Client.run(token) do |bot|
        evento = Event.find(event)
        usuarios = evento.event_to_users
          usuarios.each do |event_user|
            user_id = event_user.user.telegram_id
              bot.api.send_message(chat_id: user_id, text: @hola)
          end
      end
    end

  #ENVIO A USUARIOS UNICOS
    array.each do |user|
      TeleNotify::TelegramUser.find(user).send_message(@hola)
    end

  end
end
