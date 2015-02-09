class PupilHourController < ApplicationController

  def show
    @pupil_hour = PupilHour.find params[:id]
  end

  def update
    pupil_hour = PupilHour.find params[:id]
    date = date_picker_to_mongo params[:pupil_hour][:date_class]
    params[:pupil_hour][:date_class] = date
    ap params
    pupil_hour.update_attributes params[:pupil_hour]

  end

  def destroy
    pupil_hour = PupilHour.find params[:id]
    pupil_hour.destroy
    redirect_to training_clas_path(params[:training_class])
  end

end