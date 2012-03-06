class TodosController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @todo = current_user.todos.build(params[:todo])
    if @todo.save
      flash[:success] = "Todo created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @todo.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @todo = current_user.todos.find_by_id(params[:id])
      redirect_to root_path if @todo.nil?
    end

end