class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :user_id, :user
  after_create :encrypt!


  def before_save(record)
    record.credit_card_number = encrypt(record.credit_card_number)
  end

  private
  def encrypt! 
	require 'digest/sha1'
	cipher = Gibberish::AES.new(Digest::SHA1.hexdigest(user.encrypted_password))
	self.content = cipher.enc(content)
	save!
  end
end


