class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login
  validates :username, presence: true, uniqueness:true, length: {minimum: 4, maximum: 16}
  has_many :teams, dependent: :destroy
  has_many :leagues

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.username = user.provider == 'twitter' ? auth.info.nickname : auth.info.name
  	  user.email = user.username + "@" + user.provider + ".com"
    end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"]) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
  	end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def password_required?
  	super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
  	if encrypted_password.blank?
  		update_attributes(params, *options)
  	else
  		super
  	end
  end
end
