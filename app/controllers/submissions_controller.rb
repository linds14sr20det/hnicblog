class SubmissionsController < ApplicationController
  before_action :logged_in_user
  before_action :submissions_for_user_or_admin, only: [:edit, :update, :destroy]
  before_action :submissions_for_user_judge_or_admin, only: [:show]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
    if current_user.is_admin?
      submissions = Submission.joins(:cohort)
    elsif current_user.is_judge?
      submissions = Submission.joins(:cohort).where("submitted = true OR user_id = #{current_user.id}")
    else
      submissions = Submission.joins(:cohort).where(user_id: current_user.id)
    end
    @old_submissions = submissions.where("cohorts.active = false").order(:created_at).paginate(page: params[:old_page], :per_page => 12)
    @active_submissions = submissions.where("cohorts.active = true").order(:created_at).paginate(page: params[:active_page], :per_page => 12)
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
    active_cohort = Cohort.where(active: true).first
    @submission.cohort = active_cohort
    active_cohort.categories.each do |category|
      @submission.submission_categories.build({:category => category})
    end
    @submission.team_members.new({name: current_user.name, email: current_user.email})
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.cohort = Cohort.where(active: true).first
    @submission.user = current_user
    @submission.submitted = true if params[:submit_judges]
    if @submission.save
      flash[:info] = "Submission has been saved."
      redirect_to submissions_path
    else
      render 'new'
    end
  end

  def edit
    @submission = Submission.find(params[:id])
    existing_s_c = @submission.submission_categories.map(&:category_id)
    categories = @submission.cohort.categories.reject { |category| existing_s_c.include?(category.id) }
    categories.each do |category|
      @submission.submission_categories.build({:category => category})
    end
  end

  def update
    @submission = Submission.find(params[:id])
    s_p = submission_params
    s_p[:submitted] = true if params[:submit_judges]
    if @submission.update_attributes(s_p)
      flash[:success] = "Submission updated"
      redirect_to submissions_path
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.is_judge?
      redirect_to submissions_path
    end
    Submission.find(params[:id]).destroy
    flash[:success] = "Submission deleted"
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:name, :description, :project_location, :cisc_number, :contact_cisc, :steelwork_completion_date, attachments_attributes: [:id, :url, :_destroy], team_members_attributes: [:id, :name, :title, :email, :_destroy], submission_categories_attributes: [:id, :description, :category_id, :_destroy])
  end

  # Before filters

  # Confirms the submission is owned by the current user.
  def submissions_for_user_or_admin
    @submission = Submission.find(params[:id])
    redirect_to(root_url) unless current_user?(@submission.user) || current_user.is_admin?
  end

  def submissions_for_user_judge_or_admin
    @submission = Submission.find(params[:id])
    redirect_to(root_url) unless current_user?(@submission.user) || current_user.is_judge? || current_user.is_admin?
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end