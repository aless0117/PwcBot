class SenderUserController < ApplicationController

  def index
    @telegramusers= TeleNotify::TelegramUser.all

    @messages = Message.all
  end


  def create

    if params[:telegram_user][:telegram_id].any?
        params[:telegram_user][:telegram_id].reject!(&:empty?)
    end

    @hola=params[:message]
    array = params[:telegram_user][:telegram_id]



    array.each do |user|
      TeleNotify::TelegramUser.find(user).send_message(@hola)
    end

  end
end
