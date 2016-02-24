class Content < ActiveRecord::Base
  belongs_to :page
  has_many :images, :dependent => :destroy
end
