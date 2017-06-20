class SendAudioToUserController < ApplicationController
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
      @audio=params[:audio]
      array = params[:telegram_user][:telegram_id]
      array2 = params[:event][:event_id]
      token = "433749830:AAEhbBaPZIhZC5bGzmwwBZZ7NgzH5ZfcdCA"

    #ENVIO DEL MENSAJE A GRUPOS
      array2.each do |event|
        Telegram::Bot::Client.run(token) do |bot|
          evento = Event.find(event)
          usuarios = evento.event_to_users
            usuarios.each do |event_user|
              user_id = event_user.user.telegram_id
                bot.api.send_audio(chat_id: user_id, audio: Faraday::UploadIO.new(@audio, 'audio/mp3'))
            end
        end
      end

    array.each do |user|
      Telegram::Bot::Client.run(token) do |bot|

          @hola = TeleNotify::TelegramUser.find(user).telegram_id

            bot.api.send_audio(chat_id: @hola, audio: Faraday::UploadIO.new(@audio, 'audio/mp3'))

        end
    end



  end
end
