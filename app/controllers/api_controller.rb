class ApiController < ApplicationController
  def update_code
    # NEED TO ADD CHANNEL DIFFERENTIATION ONCE URL STRUCTURE IMPLEMENTED
    Pusher["test"].trigger_async('update_code', params[:code])
    render :text => "updated"
  end

  def run_code
    # LOOK INTO CREATING FILE ON SERVER ITSELF
    # MAKE INTO BACKGROUND TASK

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

    render :json => { :code => @code_result }
  end
end
