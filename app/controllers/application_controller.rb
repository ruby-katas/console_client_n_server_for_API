class ApplicationController < ActionController::Base

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  acts_as_token_authentication_handler_for User

  protected

  def json_request?
    request.format.json?
  end

  #protect_from_forgery with: :null_session,
  #:if => Proc.new { |c| c.request.format == 'application/json' }
end
