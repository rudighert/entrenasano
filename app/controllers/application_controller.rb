class ApplicationController < ActionController::Base
  # protect_from_forgery
  helper_method :trainer_logged_in?


  def trainer_logged_in?
    !current_trainer.nil?
  end

  def get_aviable_pupils
    Pupil.all.collect{|p| p.get_name}
  end

  def date_picker_to_mongo date
    date = date.split('/')
    return (Time.new(date[2].to_i,date[1].to_i,date[0].to_i).utc)
  end

end
