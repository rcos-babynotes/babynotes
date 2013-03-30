class BabiesController < ApplicationController
  #require 'will_paginate'
  before_filter :user_owns_baby, only: [:show, :edit, :update]

  def index
    @babies = current_user.babies
  end

  def show
    @baby = Baby.find(params[:id])
    @events = @baby.events.order("happened_at DESC").page(params[:page]).per_page(3)
    respond_to do |format|
      format.html
      format.js {render "shared/infinite_scroll"}
    end

  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = current_user.babies.new(params[:baby])
    if @baby.save
      flash[:success] = "Baby added!"
      redirect_to babies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @baby.update_attributes(params[:baby])
      flash[:success] = "Baby updated!"
      redirect_to baby_path(@baby)
    else
      render "edit"
    end
  end
end
