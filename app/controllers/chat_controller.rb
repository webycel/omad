class ChatController < ApplicationController

	before_action :require_user, only: [:index, :showAll]

	def showAll

	end

end
