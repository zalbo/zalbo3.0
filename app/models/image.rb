class Image < ActiveRecord::Base
   belongs_to :project

   has_attached_file :uplaod_photo , styles: { medium: "687x460>", thumb: "270x181>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :uplaod_photo, content_type: /\Aimage\/.*\Z/
end
