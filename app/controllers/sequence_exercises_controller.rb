class SequenceExercisesController < ApplicationController
  before_filter :find_model, :only => :update

  def update
    @sequence_exercise.update_attributes(params[:sequence_exercise])
  end

  def order
    params[:exercises].each_with_index do |order, index|
      SequenceExercise.find(order.to_i).update_attribute(:exercise_order, index)
    end
    render :nothing => true
  end

  private
  def find_model
    @sequence_exercise = SequenceExercise.find(params[:id]) if params[:id]
  end

end