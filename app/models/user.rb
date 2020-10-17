class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create!( name: auth.info.name,
                              email: auth.info.email,
                           provider: auth.provider,
                                uid: auth.uid,
                              token: auth.credentials.token,
                           password: Devise.friendly_token[0, 20],
                               meta: auth.to_yaml)
    end
    user
  end


  has_many :posts, dependent: :destroy
  has_many :day_weights, dependent: :destroy
  has_many :day_records, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower, dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy


  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end



  enum status: { '有効': true, '退会済': false }
  enum sex: {男: 0, 女: 1}

  attachment :profile_image


  def userbmi
      if tall.nil? || weight.nil?
      else
  	  bmi_tall = ( tall.to_f/100.to_f ) * (tall.to_f/100.to_f)
      userbmi = weight.to_f/bmi_tall.to_f
      userbmi = userbmi.floor(2)
      end
  end


end
