class TrainingClassController < ApplicationController
  def create
    parameters = params_to_class_training_class params
    trainig_class = TrainingClass.create parameters
  end

  def new
    @aviable_pupils = get_aviable_pupils
    @trainig_class = TrainingClass.new
  end

  def show
    @trainig_class = TrainingClass.find params[:id]
  end

  def update
    parameters = params_to_class_training_class params
    @trainig_class = TrainingClass.find params[:id]
    @trainig_class.update_attributes parameters
    redirect_to training_clas_path
  end

  def params_to_class_training_class params
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
    return p
  end
end