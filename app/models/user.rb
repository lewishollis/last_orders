class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Enums
  enum :role, { user: 'user', owner: 'owner', admin: 'admin' }

  # Callbacks
  after_initialize :set_default_role, if: :new_record?

  # Associations
  has_many :bars, foreign_key: 'user_id', dependent: :destroy
  has_many :user_beer_mats, dependent: :destroy
  has_many :beer_mats, through: :user_beer_mats
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reports, foreign_key: 'admin_id', dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :role, presence: true

  private

  # Set default role to 'user' if not specified
  def set_default_role
    self.role ||= :user
  end
end
