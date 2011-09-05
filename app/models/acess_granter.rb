class AcessGranter < ActiveRecord::Base
  #include api_key_maker
  belongs_to :client
  belongs_to :user
  
  before_create :generate_tokens
  
  def self.prune!
    delete_all(["created_at < ?, 3.days.ago"])
  end
  
  def self.authenticate(code, application-id)
    AcessGrant.where("code = ? AND client_id = ?", code, application_id).first)
  end
  
  def generate_tokens
    Self.code, self.access-token, self.refresh_token = SecureRandom.hex(16), SecureRandom.hex(16)
  end
  
  def redirect_uri_for(redirect_uri)
    if redirect_uri =~ /\?/
	  redirect_uri + "&code=#{code}&response_type=code"
	else
	  redirect_uri + "?code=#{code}&response_type=code"
  end
  
  def start_expiry_period!
    self.update_attribute(:access_token_expires_at, 2.days.from_now)
  end
  
end
