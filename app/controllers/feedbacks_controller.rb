class FeedbacksController < ApplicationController
  # before_filter :redirect_if_unauthenticated
  # before_filter :redirect_if_unauthorized, except: :new

  def new
    @company = Company.includes(:topics, :feedback_questions).find(current_user.company.id)
    @interview = Interview.includes(:candidate).find_by_identifier(params[:interview_id])
    #@questions = @interview.employee.company.feedback_questions
  end

  def create
    if params[:topic]
      params[:topic].each do |topic|
        topic.each do |key, value|
          ct = CoveredTopic.new
          ct.topic_id = key
          ct.candidate_id = params[:candidate_id]
          ct.save
        end
      end
    end

    if !params[:response].nil?
      params[:response].each do |response|
        r = FeedbackResponse.new

        r.feedback_question_id = response[:q_id]

        r.candidate_id = params[:candidate_id]
        r.employee_id = current_user.id
        r.response = response[:response]
        r.save
      end
    end

    if params[:recommend] == "true" || params[:recommend] == "false"
      interview = Interview.find_by_identifier(params[:interview_id])
      interview.recommend_hire = params[:recommend]
      interview.save
    end

    redirect_to current_user
  end
end