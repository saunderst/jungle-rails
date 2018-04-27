class Admin::CategoriesController < ApplicationController

  def index
    @category_counts = Category.includes(:products).map {|c| [c.name, c.products.size] }
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created.'
    else
      render :new
    end
  end

end
