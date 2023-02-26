class Staff < ApplicationRecord
  rolify
  before_create :assign_default_info
  after_create :assign_default_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum status: { disable: 0, enable: 1 }

  private

  def assign_default_info
    self.status = :enable if self.status.blank?
  end

  def assign_default_role
    self.add_role :staff if self.roles.blank?
  end
end
