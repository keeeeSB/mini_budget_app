class EntriesController < ApplicationController

  def index
    @entries = current_user.entries.order(created_at: :desc)
    @total_expense = Entry.total_expense
  end

  def new
    @entry = current_user.entries.build
    @categories = Category.all
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "記録を作成しました。"
      redirect_to user_entry_path(@entry)
    else
      flash.now[:danger] = "記録を作成できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end

  def update
    @entry = current_user.entries.find(params[:id])
    if @entry.update(entry_params)
      flash[:success] = "記録を更新できませんでした。"
      redirect_to user_entry_path(@entry)
    else
      flash.now[:danger] = "記録を更新できませんでした。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy!
    flash[:success] = "記録を削除しました。"
    redirect_to root_path, status: :see_other
  end

  private

    def entry_params
      params.require(:entry).permit(:date, :amount, :description)
    end
end
