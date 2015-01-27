class ApplicationController < ActionController::Base
  # protect_from_forgery
  helper_method :trainer_logged_in?


  def trainer_logged_in?
    !current_trainer.nil?
  end


end
