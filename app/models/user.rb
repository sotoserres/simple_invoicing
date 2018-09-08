class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google, :facebook]

  has_many :openids, dependent: :destroy

  # Validations always
  validates :email, presence: true
  validates :email, uniqueness: true

  # Validate only on sign_up
  validates :password, length: { minimum: 4, maximum: 128 }, allow_blank: false, if: proc { |u| u.new_record? }

  # Validations for existing users
  validates :current_password, length: { minimum: 4, maximum: 128 }, allow_blank: true

  def name
    "#{first_name} #{last_name}" if first_name.present? || last_name.present?
  end

  def name_formatted
    name.parameterize.underscore
  end

  # Searches for user based on email. Returns found user or new user.
  # ====Returns
  # * +User::ActiveRecord_Relation+ -> user
  def self.find_for_auth(auth, current_user = nil)
    user = current_user

    user = User.where(email: auth.info.email).first_or_initialize if user.nil? # No current user available, user is not already logged in

    if user.new_record?
      user.email = auth.info.email
      user.first_name = auth.info.username
      user.last_name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
    user
  end
end
