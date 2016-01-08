class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_presence_of :name, :email, :password

  has_and_belongs_to_many :roles
  def has_role? name
    roles.include? Role.find_by_name(name)
  end
  include Authority::UserAbilities
end