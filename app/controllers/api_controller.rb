class ApiController < ApplicationController
  def update_code
    Pusher[params[:channel]].trigger_async('update_code', params[:code])
    render :text => "code updated"
  end

  def update_challenge
    @challenge = Challenge.find(params[:challenge_id])
    Pusher[params[:channel]].trigger_async('update_challenge', @challenge)
    GivenChallenge.create(challenge_id: @challenge.id, candidate_id: params[:candidate_id], interview_id: params[:interview_id])
    render :text => "challenge updated"
  end

  def run_code
    # LOOK INTO CREATING FILE ON SERVER ITSELF
    # MAYBE MAKE INTO BACKGROUND TASK

    File.open("public/test.rb", 'w') {|f| f.write(params[:code]) }

    Net::SFTP.start(ENV['AWS_HOST'], ENV['AWS_USER'], :password => ENV['AWS_PASS']) do |sftp|
      sftp.upload!("public/test.rb")
    end

    @code_result = ""

    Net::SSH.start(ENV['AWS_HOST'], ENV['AWS_USER'], :password => ENV['AWS_PASS']) do |session|
      session.exec("ruby test.rb") do |ch, stream, data|
        @code_result += data
      end
    end

    Pusher[params[:channel]].trigger_async('update_result', @code_result)

    render :text => "result updated"
  end
end
