class Games::User < ModelBase
  has_many :games, :class_name => 'Games::Game'

  validate :valid_password?
  validate :valid_email?
  validate :valid_username?

  before_save :encrypt_password
  after_save :clear_password

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
  end

  def valid_email?
  end

  def valid_username?
  end

end
