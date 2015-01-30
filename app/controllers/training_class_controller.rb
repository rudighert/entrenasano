class TrainingClassController < ApplicationController
  def create
    p = params[:training_class]
    pupils_selected = p[:pupils]
    p[:trainer_id] = current_trainer.id
    p.delete(:pupils)
    list_pupils = []
    pupils_selected.each do |id_pupil|
      pupil = Pupil.find id_pupil
      list_pupils << pupil
    end
    p[:pupils] = list_pupils
    trainig_class = TrainingClass.create p
  end

  def new
    @aviable_pupils = get_aviable_pupils
    @trainig_class = TrainingClass.new
  end
end