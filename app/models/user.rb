class User < ActiveRecord::Base
  require "digest"

  attr_accessible :name, :email, :password, :password_confirmation
  has_many :groupmembers
  has_many :billparticipants
  has_many :groups, :through => :groupmembers
  has_many :bills, :through => :billparticipants

  #Validations
  validates :name, :presence => true, :length => {:maximum => 24}

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format   => { :with => email_regex },
            :uniqueness => true

  validates :password, :confirmation => true,
            :presence => true,
            :length => {:within => 6..40}

  before_save :encrypt_password


  def has_password? (passwordIn)
    password == encrypt(passwordIn)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end


  private
  def encrypt_password
    self.salt = make_salt if new_record?
    self.password = encrypt(password)
  end

  def encrypt(string)
    hash_string("#{salt}--#{string}")
  end

  def make_salt
    hash_string("#{Time.now}")
  end

  def hash_string(to_hash)
    Digest::SHA2.hexdigest(to_hash)
  end
end
