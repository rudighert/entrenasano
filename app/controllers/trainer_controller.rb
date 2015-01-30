class TrainerController < ApplicationController
  def index
    @pupil=Pupil.new
    @pupil_hour=PupilHour.new
    @today =  Date.today.strftime("%m/%d/%Y")
    @aviable_pupils = get_aviable_pupils
  end

  def show

  end



  def add_hour_in_class
    date = params[:pupil_hour][:date_class].split('/')
    params[:pupil_hour][:date_class] = Time.new(date[2].to_i,date[0].to_i,date[1].to_i).utc
    pupil_hour = PupilHour.new params[:pupil_hour]
    training_class = TrainingClass.find params[:pupil_hour][:training_class_id]
    training_class.add_pupil_hour pupil_hour
    redirect_to trainer_index_path
  end



end
