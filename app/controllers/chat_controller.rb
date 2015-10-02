class ChatController < ApplicationController

	before_action :require_user, only: [:showAll]

	def showAll

	end

end
