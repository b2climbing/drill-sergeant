class SequenceExercisesController < ApplicationController
  before_filter :find_model

  def update
    @sequence_exercise.update_attributes(params[:sequence_exercise])
  end

  private
  def find_model
    @sequence_exercise = SequenceExercise .find(params[:id]) if params[:id]
  end

end