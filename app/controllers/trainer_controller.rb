class TrainerController < ApplicationController
  def index
    @pupil=Pupil.new
    @pupil_hour=PupilHour.new
  end

  def show

  end

  def add_pupil
    date = params[:pupil][:birthday].split('/')
    ap date
    params[:pupil][:birthday] = DateTime.new(date[2].to_i,date[1].to_i,date[0].to_i).utc
    ap params
    current_trainer.add_pupil params[:pupil]
    redirect_to trainer_index_path
  end

  def add_hour_in_pupil
    redirect_to trainer_index_path
  end

end
