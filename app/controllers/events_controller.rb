class EventsController < ApplicationController
  require 'will_paginate/array'
	before_filter :authenticate_user!
  before_filter :user_owns_baby
  before_filter :baby_owns_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = @baby.events.order("happened_at DESC").page(params[:page]).per_page(3)
    respond_to do |format|
      format.html
      format.js {render "shared/infinite_scroll"}
    end

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

  def destroy
    @event.destroy
    redirect_to baby_path(@baby)
  end
      
end
