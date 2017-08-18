class Pet < ApplicationRecord
	
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_size :avatar, :in => 0.megabytes..1.megabytes


  has_many :pet_battles
	has_many :battles, through: :pet_battles
	belongs_to :owner, class_name: "User"

	validates :name, :animal_type, :owner_id, :cuteness, presence: true
end
