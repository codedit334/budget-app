class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:its_transactions) || []
    @total_amount = @categories.sum do |category|
      category.its_transactions.sum(:amount)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    # Render the edit view template
    render :edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path, notice: 'Category deleted successfully.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
