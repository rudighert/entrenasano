class ApplicationController < ActionController::Base
  # protect_from_forgery
  helper_method :trainer_logged_in?


  def trainer_logged_in?
    !current_trainer.nil?
  end

  def get_aviable_pupils
    Pupil.all.collect{|p| p.get_name}
  end

end
