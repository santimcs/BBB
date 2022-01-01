class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy  
  default_scope {order('name asc')}
  scope :published, -> { where(chosen: true) }
  scope :by_name_asc, -> { order(name: :asc) }  
  scope :by_name_desc, -> { order(name: :desc) }    
  scope :by_songs, -> { order(charted_songs: :desc) }

end
