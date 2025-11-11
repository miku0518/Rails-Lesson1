class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :allday, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました!"
      redirect_to  schedules_path
    else
      flash[:alert] = "スケジュールの登録に失敗しました!"
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :allday, :memo))
      flash[:notice] = "予定を更新しました!"
      redirect_to schedules_path 
    else
      flash[:alert] = "予定の更新に失敗しました!" 
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to schedules_path
  end
end
