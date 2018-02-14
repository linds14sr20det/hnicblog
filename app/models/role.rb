class Role < ApplicationRecord
  belongs_to :user

  enum role: [:applicant, :judge, :admin]

  def is_admin?
    return true if role == :admin.to_s
    false
    end

  def is_judge?
    return true if role == :judge.to_s
    false
  end
end
