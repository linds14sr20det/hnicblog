class CohortsController < ApplicationController
  before_action :logged_in_user
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
    @active_cohort = Cohort.where(active: true)
    @cohorts = Cohort.where(active: false).paginate(page: params[:page], :per_page => 12)
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.active = true if params[:activate_cohort]
    if @cohort.save
      flash[:success] = "Cohort created."
      redirect_to cohorts_path
    else
      render 'new'
    end
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    c_p = cohort_params
    c_p[:active] = true if params[:activate_cohort]
    if @cohort.update_attributes(c_p)
      flash[:success] = "Profile updated"
      redirect_to cohorts_path
    else
      render 'edit'
    end
  end

  def destroy
    Cohort.find(params[:id]).destroy
    flash[:success] = "Cohort deleted"
    redirect_to cohorts_path
  end

  private

    def cohort_params
      params.require(:cohort).permit(:start_at, :end_at, :date_description, :active, systems_attributes: [:id, :title, :description, :date_description, :max_players, :_destroy, attachment_attributes: [:url]])
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end