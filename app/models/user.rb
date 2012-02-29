class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :system_role, :alias

  validates_presence_of :name, :surname, :alias, :system_role
  validates_uniqueness_of :alias

  def alias=(text)
    write_attribute :alias, text.upcase
  end

end
