module UserContent

  def self.included(base)
    base.has_rakismet :author => proc { user.username },
      :author_email => proc { user.email },
      :content => :body
    base.acts_as_voteable
    base.acts_as_textiled :body
    base.before_create :check_for_spam
    base.before_save :geoip_from_request
    base.class_eval do
      include InstanceMethods
      extend ClassMethods
    end
  end

  module InstanceMethods

    def request=(request)
      self.user_ip    = request.remote_ip
      self.user_agent = request.env['HTTP_USER_AGENT']
      self.referrer   = request.env['HTTP_REFERER']
    end

    def check_for_spam
      self.approved = self.spam?
      self.akismet = self.akismet_response
      true # return true so it doesn't stop save
    end

    def mark_as_spam!
      update_attribute(:approved, false)
      spam!
    end

    def mark_as_ham!
      update_attribute(:approved, true)
      ham!
    end

    def geoip_from_request
      location = Geo.lookup(self.user_ip)
      self.country_code = location[2] || ""
      self.country_code3 = location[3] || ""
      self.country_name = location[4] || ""
      self.region = location[6] || ""
      self.city = location[7] || ""
      self.postal_code = location[8] || ""
      self.latitude = location[9] || ""
      self.longitude = location[10] || ""
    end
  end

  module ClassMethods
  end

end