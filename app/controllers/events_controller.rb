class EventsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :user_owns_baby
  before_filter :baby_owns_event

  def index
  end

  def new
    @event = @baby.events.new
  end

  def create
    @event = @baby.events.new(params[:event])

    if @event.save
      flash[:success] = "Timeline event logged!"
      redirect_to baby_path(@baby)
    else
      render "new"
    end
  end

  def edit
  end

  def update
     if @event.update_attributes(params[:event])
      flash[:success] = "Event updated!"
      redirect_to baby_path(@baby)
    else
      render "edit"
    end
  end

  def delete
  end
      
end
