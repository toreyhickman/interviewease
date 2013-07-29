class ApiController < ApplicationController
  def update_code
    # NEED TO ADD CHANNEL DIFFERENTIATION ONCE URL STRUCTURE IMPLEMENTED
    Pusher["test"].trigger_async('update_code', params[:code])
    render :text => "updated"
  end

  def run_code
    # LOOK INTO CREATING FILE ON SERVER ITSELF
    # MAKE INTO BACKGROUND TASK

    # Look into TempFile http://www.ruby-doc.org/stdlib-1.9.3/libdoc/tempfile/rdoc/Tempfile.html
    File.open("public/test.rb", 'w') {|f| f.write(params[:code]) }

    time = Benchmark.measure do
      Net::SFTP.start(ENV['aws_host'], ENV['aws_user'], :password => ENV['aws_pass']) do |sftp|
        sftp.upload!("public/test.rb")
      end
    end

    Rails.logger.info("Time to upload code: #{time.inspect}")

    @code_result = ""

    # Maybe write your own Ruby server, listening on a socket:
    # http://socrates.devbootcamp.com/challenges/412
    Net::SSH.start(ENV['aws_host'], ENV['aws_user'], :password => ENV['aws_pass']) do |session|
      session.exec("ruby test.rb") do |ch, stream, data|
        @code_result += data
      end
    end

    render :json => { :code => @code_result }
  end
end
