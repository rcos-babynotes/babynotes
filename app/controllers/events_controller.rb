class EventsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :user_owns_baby
  before_filter :baby_owns_event

  def new
    @event = @baby.events.new
  end

  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      flash[:success] = "Timeline event logged!"
      redirect_to baby_path(@baby)
    else
      render "new"
    end
  end

  def destroy
  end
      
end
