class SequenceExercisesController < ApplicationController
  before_filter :find_model, :only => :update

  def update
    ['time(1i)', 'time(2i)', 'time(3i)'].each{|value| params[:sequence_exercise].delete(value)}
    hours = params[:sequence_exercise].delete('time(4i)')
    minutes = params[:sequence_exercise].delete('time(5i)')
    seconds = params[:sequence_exercise].delete('time(6i)')
    @sequence_exercise.update_attributes(params[:sequence_exercise].merge(:time => time_to_int(hours, minutes, seconds)))
    render :nothing => true
  end

  def order
    params[:exercises].each_with_index do |order, index|
      SequenceExercise.find(order.to_i).update_attribute(:exercise_order, index)
    end
    if request.xhr?
      render :nothing => true
    else
      redirect_to :controller => params[:redirect][:controller], :action => params[:redirect][:action]
    end
  end

  private
  def find_model
    @sequence_exercise = SequenceExercise.find(params[:id]) if params[:id]
  end

  def time_to_int(hours, minutes, seconds)
    acc = hours && hours.to_i * 3600
    acc += minutes && minutes.to_i * 60
    acc += seconds.to_i
    acc || 0
  end

end