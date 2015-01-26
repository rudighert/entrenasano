class TrainerController < ApplicationController
  def index
    @pupil=Pupil.new
    @pupil_hour=PupilHour.new
  end

  def show

  end

  def add_pupil
    date = params[:pupil][:birthday].split('/')
    params[:pupil][:birthday] = Time.new(date[2],date[1],date[0]).utc
    current_trainer.add_pupil params[:pupil]
    redirect_to trainer_index_path
  end

  def add_hour_in_pupil
    redirect_to trainer_index_path
  end

end
