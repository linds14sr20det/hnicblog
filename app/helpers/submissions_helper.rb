module SubmissionsHelper

  # Returns the index controls for the given user.
  def controls_for(submission, user)
    controls = []
    controls << (link_to 'download PDF', submission_download_path(submission, format: 'pdf'), target: '_blank', class: 'download')
    if (submission.user == user && !submission.submitted)
      controls << (link_to 'edit', edit_submission_path(submission))
      controls << (link_to "delete", submission, method: :delete, data: { confirm: "You sure?" })
    end
    controls.join(" | ")
  end
end
