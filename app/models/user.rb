class User < ActiveRecord::Base
  ##Avatar##
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "60x60#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  ##

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:nickname].nil?
        where(conditions).first
      else
        where(nickname: conditions[:nickname]).first
      end
    end
  end

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
