class DownloadsController < ApplicationController
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
    send_file download.to_pdf, download_attributes
  end

  def download_attributes
    {
        filename: download.filename,
        type: "application/pdf",
        disposition: "inline"
    }
  end
end