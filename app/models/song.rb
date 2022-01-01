class Song < ApplicationRecord
  belongs_to :artist
  has_one :lyric
  mount_uploader :mp3, Mp3Uploader

  scope :selected, -> { where('nbr < 99') }
  scope :by_nbr_asc, -> { order(nbr: :asc) }

end
