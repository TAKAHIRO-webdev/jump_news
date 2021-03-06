class Link < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :title,
	     presence: true,
	     uniqueness: { case_sensitive: false }

  validates :url,
	     format: { with: %r{\Ahttps?://} },
             allow_blank: true


end
