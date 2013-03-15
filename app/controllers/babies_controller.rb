class BabiesController < ApplicationController
  before_filter :user_owns_baby, only: [:show]

  def index
    @babies = current_user.babies
  end

  def show
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

private
  def user_owns_baby
    @baby = current_user.babies.find(params[:id])

    if @baby.nil?
      redirect_to root_path
    end
  end
end
