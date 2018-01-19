class User < ActiveRecord::Base
  PERMISSIONS = %w(admin ta student)
  validates_presence_of :email
  validates_uniqueness_of :email
  enum permissions: PERMISSIONS
  validates :permissions, inclusion: {in: PERMISSIONS}
end
