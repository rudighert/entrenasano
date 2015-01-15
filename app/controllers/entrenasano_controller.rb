class EntrenasanoController < ApplicationController
  def index
    unless current_trainer.nil?
      redirect_to trainer_index_path
    end
  end




end
