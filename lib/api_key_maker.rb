Module ApiKeyMaker 
  def enable_api!
    self.generate_api_key!
  end
  
  def disable_api!
    self.update_attribute(:api_key, "") 
  end
  
  def api_is_enabled?
    !self.api_key.empty
  end
  
  protectd
  
  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end
  
  def generate_api_key!
    self.update_attribute(:api_key), secure_digest(Time.now, (1..10).map{ rand.to_s }))
  end
end