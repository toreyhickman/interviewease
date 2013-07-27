class ApiController < ApplicationController
  def update_code
    # NEED TO ADD CHANNEL DIFFERENTIATION ONCE URL STRUCTURE IMPLEMENTED
    Pusher["test"].trigger_async('update_code', params[:code])
    render :text => "updated"
  end
end
