class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  PERMISSIONS = %w(admin ta student)
  validates_presence_of :email
  validates_uniqueness_of :email
  enum permissions: PERMISSIONS
  validates :permissions, inclusion: {in: PERMISSIONS}
end
