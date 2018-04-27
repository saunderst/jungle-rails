class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.all.order(name: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

end
