class MeasurementsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_owns_baby
  before_filter :baby_owns_measurement

  def index
  end
  
  def new
    @measurement = @baby.measurements.new
  end

  def create
    @measurement = @baby.measurements.new(params[:measurement])

    if @measurement.save
      flash[:success] = "Measurement logged!"
      redirect_to baby_path(@baby)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @measurement.update_attributes(params[:measurement])
      flash[:success] = "Measurement updated!"
      redirect_to baby_path(@baby)
    else
      render "edit"
    end
  end

  def delete
  end
end
