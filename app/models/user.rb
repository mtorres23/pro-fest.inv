class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :account
  has_many :assignments
  validates_presence_of :account_id
  before_validation :set_user_account
  before_validation :set_permissions

  def set_user_account
    self.account_id = find_account(self.account_id).id
  end

  def set_permissions
    self.permission_level = 2
  end

  protected
  def find_account(key)
    return Account.find_by(account_access_key: key)
  end

end
