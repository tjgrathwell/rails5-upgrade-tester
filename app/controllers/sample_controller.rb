class SampleController < ApplicationController
  def message
    respond_to do |format|
      format.json do
        render json: {msg: message_text}
      end
      format.html do
        @message_text = message_text
      end
    end
  end

  private

  def message_text
    if request.headers['X-OVERRIDE-MESSAGE']
      return request.headers['X-OVERRIDE-MESSAGE']
    end
    params[:message_text] || 'hello_world'
  end
end
