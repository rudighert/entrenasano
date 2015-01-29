class TrainerController < ApplicationController
  def index
    @pupil=Pupil.new
    @pupil_hour=PupilHour.new
    @today =  Date.today.strftime("%m/%d/%Y")
    @aviable_pupils = get_aviable_pupils
  end

  def show

  end

  def add_pupil

  end

  def add_hour_in_pupil
    redirect_to trainer_index_path
  end

  def get_aviable_pupils
    Pupil.all.collect{|p| p.get_name}
  end

end
