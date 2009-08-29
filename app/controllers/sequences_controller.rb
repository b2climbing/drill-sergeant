class SequencesController < ApplicationController

  def index
    @sequences = Sequence.all
  end

  def new
    @sequence = Sequence.new
  end

  def edit
    @sequence = Sequence.find(params[:id])
  end

  def order
    params[:exercises].each_with_index do |order, index|
      SequenceExercise.find(order.to_i).update_attribute(:exercise_order, index)
    end
    render :nothing => true
  end

end