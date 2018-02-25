class DownloadsController < ApplicationController
  before_action :logged_in_user
  before_action :submissions_for_user_judge_or_admin, only: [:show]
  after_action :clear_tmp

  def show
    respond_to do |format|
      format.pdf { submission_pdf }
    end
  end

  private

  def submission
    Submission.find(params[:submission_id])
  end

  def download
    Download.new(submission)
  end

  def submission_pdf
    pdf = download.to_pdf
    send_file pdf, download_attributes
  end

  def download_attributes
    {
        filename: download.filename,
        type: "application/pdf",
        disposition: "inline"
    }
  end

  def submissions_for_user_judge_or_admin
    redirect_to(root_url) unless current_user?(submission.user) || current_user.is_judge? || current_user.is_admin?
  end

  def clear_tmp
    #TODO: run this on a delayed task
    #File.delete("tmp/submission_#{submission.id}.pdf")
  end
end