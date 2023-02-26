class User < ApplicationRecord
  before_create :assign_default_info
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum status: { disable: 0, enable: 1 }
  enum rank: { dongsan: 0, namsan: 1, chunggaesan: 2 }

  private

  def assign_default_info
    self.status = :enable if self.status.blank?
    self.rank = :dongsan if self.rank.blank?
  end
end
