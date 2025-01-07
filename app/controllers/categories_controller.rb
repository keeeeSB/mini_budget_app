class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, success: "カテゴリーを追加しました。"
    else
      redirect_to root_path, danger: "カテゴリーを追加できませんでした。"
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to root_path, success: "カテゴリーを更新しました。"
    else
      redirect_to root_path, danger: "カテゴリーを更新できませんでした。"
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
