class TeamMember < ApplicationRecord
  belongs_to :submission
  attr_accessor :title_selected_value
  TITLES = [ "Project Lead", "Fabricator", "Architect", "Engineer", "General Contractor", "Steel Detailer", "Steel Erector", "Owner" ]


  def selected_title
    return self.title if TITLES.include?(self.title)
    return TITLES.first if self.title.nil?
    I18n.t("submission.team_member.titles.other")
  end

  def titles_with_other
    TeamMember::TITLES + [I18n.t("submission.team_member.titles.other")]
  end
end
