class CategoriesController < ApplicationController
  def index
    @user_categories = Category.where(user_id: current_user.id)
  end

  def new; 
    @category = Category.new
  end

  def create
    # Category.create(name: params[:name], icon: params[:icon], user_id: params[:user_id])
    # redirect_to '/categories'
    @category = Category.new(category_params)
    @category.user = current_user
    
    respond_to do |format|
      format.html do
        if @category.save
          flash[:notice] = 'Category created successfully'
          redirect_to categories_path
        else
          flash[:error] = 'Category not created'
          redirect_to categories_path
        end
      end
    end
  end

  private 

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
