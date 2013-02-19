class BabiesController < ApplicationController
  before_filter :user_owns_baby, only: [:show]

  def index
    @babies = current_user.babies
  end

  def show

  end

  def new
    
  end

  def create

  end

private
  def user_owns_baby
    @baby = current_user.babies.find(params[:id])

    if @baby.nil?
      redirect_to root_path
    end
  end
end
