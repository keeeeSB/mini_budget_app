class EntriesController < ApplicationController

  def index
    @entries = current_user.entries.order(created_at: :desc)
  end

  def new
    @entry = current_user.entries.build(entry_params)
    end
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to @entry, success: "記録を作成しました。"
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
      redirect_to @entry, success: "記録を更新しました。"
    else
      flash.now[:danger] = "記録を更新できませんでした。"
      render :edit, status: :unprocessable_entity
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
