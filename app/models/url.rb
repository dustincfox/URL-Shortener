class Url < ActiveRecord::Base
  belongs_to :user

  before_save do |url|
    if !url.short_url
      self.short_url = SecureRandom.urlsafe_base64(3)
    end
  end
end