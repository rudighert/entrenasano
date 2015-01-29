class PupilController < ApplicationController
  def create
    date = params[:pupil][:birthday].split('/')
    params[:pupil][:birthday] = DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i).utc

    if Pupil.create params[:pupil]
      redirect_to root_path
    else
      redirect_to new_pupil_path
    end
  end

  def new
    @pupil=Pupil.new
  end
end