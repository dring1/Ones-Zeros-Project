class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, presence: true

   has_many :comments, dependent: :destroy
   has_many :voted_on_relationships, foreign_key: "user_id", dependent: :destroy
   has_many :tag_relationships, foreign_key: "user_id", dependent: :destroy

   has_many :articles, through: :voted_on_relationships
   has_many :tags, through: :tag_relationships
end
