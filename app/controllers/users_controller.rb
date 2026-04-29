class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user,     only: [:index, :destroy, :edit_basic_info, :update_basic_info]
  before_action :set_user,       only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :admin_or_correct_user, only: [:show, :edit, :update]
  before_action :set_one_month,  only: [:show, :edit, :update]

  def index
    @users = if params[:name].present?
      User.where("name LIKE ?", "%#{params[:name]}%").paginate(page: params[:page], per_page: 20)
    else
      User.paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def edit
  end

  def update
    failed_records = {}

    params[:attendances]&.each do |id, attrs|
      attendance = @user.attendances.find(id)
      attendance.assign_attributes(attendance_params(attrs))
      failed_records[attendance.id] = attendance unless attendance.save(context: :edit_attendance)
    end

    if failed_records.empty?
      redirect_to @user, notice: "勤怠情報を更新しました。"
    else
      @attendances = @attendances.map { |a| failed_records[a.id] || a }
      render :edit, status: :unprocessable_entity
    end
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update(basic_info_params)
      redirect_to users_path, notice: "#{@user.name}の基本情報を更新しました。"
    else
      render :edit_basic_info, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "#{@user.name}を削除しました。"
  end

  private

  def attendance_params(attrs)
    attrs.permit(:started_at, :finished_at, :note)
  end

  def basic_info_params
    params.require(:user).permit(:employee_code, :basic_time, :work_time)
  end
end
