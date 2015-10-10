class MessagesController < ApplicationController
	before_action :require_user, only: [:showAll, :create]

	def create
		@chat = Chat.find(params[:chat_id])
		@message = @chat.messages.build(message_params)
		@message.user_id = @current_user.id
		@message.save!

		redirect_to chat_path(@chat)
	end

	private
		def message_params
			params.require(:message).permit(:body)
		end
end
