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
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def order
    params[:exercises].each_with_index do |order, index|
      SequenceExercise.find(order.to_i).update_attribute(:exercise_order, index)
    end
    render :nothing => true
  end

end