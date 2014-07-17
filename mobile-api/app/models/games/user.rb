class Games::User < ModelBase
  has_many :games, :class_name => 'Games::Game'

  validates_presence_of :email, :message => 'Please include an email'
  validates_presence_of :username, :message => 'Please include a username'
  validates_presence_of :encrypted_password, :message => 'Please include a password'
  validates_uniqueness_of :username, :message => 'Please include a unique username'

  validate :valid_password?
  validate :valid_email?
  validate :valid_username?

  before_save :encrypt_password
  after_save :clear_password

  attr_accessor :password

  def encrypt_password
    if self.password.present? && self.email.present?
      self.salt = Digest::SHA1.hexdigest "#{self.username}#{Time.now}"
      self.encrypted_password = Digest::SHA1.hexdigest "#{self.salt}#{self.password}"
    end
  end

  def clear_password
    self.password = nil
  end

  def valid_password?
    if self.password.present? && self.password.size < 6
      self.errors.add(:password, 'Please include a valid password')
    end
  end

  def valid_email?
    if self.email.present?
      unless /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/.match self.email
        self.errors.add(:email, 'Please include a valid email')
      end
    end
  end

  def valid_username?
    if self.username.present? && self.username.size < 6
      self.errors.add(:username, 'Please include a valid username')
    end
  end

  def password_cleared?
    if self.password.present?
      self.errors.add(:password, 'Please clear the password')
    end
  end

end
