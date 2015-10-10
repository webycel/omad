class ChatController < ApplicationController

	before_action :require_user, only: [:showAll, :create]

	def showAll
		# if Chat.between(@current_user.id, params[:recipient_id]).present?
			@chats = Chat.mine(@current_user.id)
		# else
		# 	@chats = nil
		# end
	end

	def create
		if Chat.between(@current_user.id, params[:recipient_id]).present?
			@chat = Chat.between(@current_user.id, params[:recipient_id]).first
		else
			params[:sender_id] = @current_user.id
			@chat = Chat.create!(chat_params)
		end

		redirect_to chat_path(@chat)
	end

	def show
		@chat = Chat.find(params[:id])
   		@reciever = interlocutor(@chat)
   		@messages = @chat.messages
   		@message = Message.new
	end

	private
		def chat_params
			params.permit(:sender_id, :recipient_id)
		end

		def interlocutor(chat)
    		current_user == chat.recipient ? chat.sender : chat.recipient
  		end

end
