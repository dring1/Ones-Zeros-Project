class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  acts_as_taggable
  acts_as_taggable_on :interests
  ActsAsTaggableOn.force_lowercase = true

  has_many :comments, dependent: :destroy

  has_many :voted_on_relationships, dependent: :destroy
  has_many :articles, through: :voted_on_relationships

  validates :username, presence: true   

end
