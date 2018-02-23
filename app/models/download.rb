require "render_anywhere"

class Download
  include RenderAnywhere

  def initialize(submission)
    @submission = submission
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    binding.pry
    kit.to_file("tmp/submission_#{submission.id}.pdf")
  end

  def filename
    "submission_#{submission.id}.pdf"
  end

  private

  attr_reader :submission

  def as_html
    render template: "submissions/pdf",
           layout: "submission_pdf",
           locals: { submission: submission }
  end
end