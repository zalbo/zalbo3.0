class Page < ActiveRecord::Base
   belongs_to :project
   has_many :contents, :dependent => :destroy
end
