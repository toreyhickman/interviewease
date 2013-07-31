class TopicsController < ApplicationController

	def new
	  @company = Company.find(current_user.company.id)
	  @topic = Topic.new
	end

	def create
	  @topic = Topic.new(params[:topic])
	  current_user.company.topics << @topic
    redirect_to current_user.company
	end

end