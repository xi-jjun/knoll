class User < ApplicationRecord
  rolify
  before_create :assign_default_info
  after_create :assign_default_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum status: { disable: 0, enable: 1 }
  enum rank: { dongsan: 0, namsan: 1, chunggaesan: 2 }

  private

  def assign_default_info
    self.status = :enable if self.status.blank?
    self.rank = :dongsan if self.rank.blank?
  end

  def assign_default_role
    # 회원가입 시, 일반 회원 권한 부여 - 단순 조회만 가능
    self.add_role :normal if self.roles.blank?
  end
end
