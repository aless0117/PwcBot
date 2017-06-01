class MessagesController < ApplicationController


  def index

    @telegramusers= TeleNotify::TelegramUser.all
    @messages = Message.all

  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

  end
end
