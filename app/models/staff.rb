class Staff < ApplicationRecord
  before_create :assign_default_info
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum status: { disable: 0, enable: 1 }

  private

  def assign_default_info
    self.status = :enable if self.status.blank?
  end
end
