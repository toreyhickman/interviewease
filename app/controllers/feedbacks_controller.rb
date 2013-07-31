class FeedbacksController < ApplicationController

  def new
    @interview = Interview.includes(:candidate).find_by_identifier(params[:interview_id])
    @questions = @interview.employee.company.feedback_questions
  end

  def create
    params[:response].each do |response|
      r = FeedbackResponse.new
      r.candidate_id = params[:candidate_id]
      r.feedback_question_id = response[:question_id]
      r.employee_id = current_user.id
      r.response = response[:response]
      r.save  
    end

    if params[:recommend] == "true" || params[:recommend] == "false"
      interview = Interview.find_by_identifier(params[:interview_id])
      interview.recommend_hire = params[:recommend]
      interview.save
    end

    redirect_to current_user
  end
end