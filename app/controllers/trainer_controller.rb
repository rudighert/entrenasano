class TrainerController < ApplicationController
  def index
    @pupil=Pupil.new
    @pupil_hour=PupilHour.new
  end

  def show

  end

  def add_pupil
    current_trainer.add_pupil params[:pupil]
    redirect_to trainer_index_path
  end

  def add_hour_in_pupil
    ap params
    redirect_to trainer_index_path
  end

end
