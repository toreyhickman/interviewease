class FeedbackQuestionsController < ApplicationController

  def new
    @question = FeedbackQuestion.new
  end

  def create
    if params[:feedback_question][:prompt] == ""
      @question = FeedbackQuestion.new
      flash[:error] = "You must enter a question prompt."
      render :new
    else
      @question = FeedbackQuestion.new(params[:feedback_question])
      current_user.company.feedback_questions << @question
      redirect_to current_user.company
    end
  end

end