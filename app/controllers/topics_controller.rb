class TopicsController < ApplicationController
  before_filter :redirect_if_unauthenticated

	def new
	  @company = Company.find(current_user.company.id)
	  @topic = Topic.new
	end

	def create
    if current_user.company.topics.create(params[:topic])
      redirect_to current_user.company
    else
      render_template :new
    end
	end
end
