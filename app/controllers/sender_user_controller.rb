class SenderUserController < ApplicationController

  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create

    @hola=params[:message]
    @hey=params[:telegram_user][:telegram_id]


    TeleNotify::TelegramUser.find(@hey).send_message(@hola)

  end
end
