class TrainerController < ApplicationController
  def index
    @pupil=Pupil.new
    @pupil_hour=PupilHour.new
    @aviable_pupils = get_aviable_pupils
  end

  def show

  end



  def add_hour_in_class
    date = date_picker_to_mongo params[:pupil_hour][:date_class]
    params[:pupil_hour][:date_class] = date
    pupil_hour = PupilHour.new params[:pupil_hour]
    training_class = TrainingClass.find params[:pupil_hour][:training_class_id]
    training_class.add_pupil_hour pupil_hour
    redirect_to trainer_index_path
  end



end
