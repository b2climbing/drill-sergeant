class SequencesController < ApplicationController

  def index
    @sequences = Sequence.all
  end

  def new
    @sequence = Sequence.new
  end

  def edit
    @sequence = Sequence.find(params[:id])
    @exercises = Exercise.all
  end

  def show
    @sequence = Sequence.find(params[:id])
  end

  def update
    @sequence = Sequence.find(params[:id])
    @sequence.update_attributes!(params[:sequence])
    flash[:notice] = 'Sequence updated'
    redirect_to :action => :edit
  end

  def create
    @sequence = Sequence.new(params[:sequence])
    if @sequence.valid?
      @sequence.save
      flash[:notice] = 'Sequence created'
      redirect_to :action => :edit, :id => @sequence.id
    else
      render :action => :new
    end
  end

  def add_exercise
    sequence_exercise = SequenceExercise.new(:sequence_id => params[:id], :exercise_id => params[:exercise])
    sequence_exercise.save
    @sequence = Sequence.find(params[:id])
    render :update do |page|
      page.replace_html 'exercise-list', :partial => 'exercise_list'
    end
  end

end