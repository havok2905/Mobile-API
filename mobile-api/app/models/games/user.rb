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
    if slef.password.size < 6
      self.errors.add(:password, 'Please include a valid password')
    end
  end

  def valid_email?
    unless /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/.match
      self.errors.add(:email, 'Please include a valid email')
    end
  end

  def valid_username?
    if where(:username).first.present?
      self.errors.add(:username, 'Please pick a unique username')
    end
  end

end
