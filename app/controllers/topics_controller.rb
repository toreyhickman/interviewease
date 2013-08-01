class TopicsController < ApplicationController

	def new
	  @company = Company.find(current_user.company.id)
	  @topic = Topic.new
	end

	def create
    if @topic = current_user.company.topics.create(params[:topic])
      redirect_to current_user.company
    else
      render :new
    end
	end
end
