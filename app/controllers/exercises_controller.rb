class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all(:order => :name)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.valid?
      @exercise.save
      flash[:notice] = 'Exercise created'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

end