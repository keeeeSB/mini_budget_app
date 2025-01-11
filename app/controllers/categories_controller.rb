class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "カテゴリーを追加しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "カテゴリーを追加できませんでした。"
      render :new, status: :unprocessable_eentity
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
