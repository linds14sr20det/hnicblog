class CohortsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :admin_user

  def index
    @cohorts = Cohort.paginate(page: params[:page], :per_page => 12)
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      flash[:success] = "Cohort created."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    if @cohort.update_attributes(cohort_params)
      flash[:success] = "Profile updated"
      redirect_to cohorts_path
    else
      render 'edit'
    end
  end

  def destroy
    Cohort.find(params[:id]).destroy
    flash[:success] = "Cohort deleted"
    redirect_to cohorts_url
  end

  private

    def cohort_params
      params.require(:cohort).permit(:start_at, :end_at)
    end

end