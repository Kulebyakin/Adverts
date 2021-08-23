class Cron < ActiveRecord::Base
  def self.publish_all_accepted_adverts
    adverts = Advert.all.where(status: :accepted)
    adverts.each do |advert|
      advert.publish
    end

    adverts.each do |advert| 
      if advert.save
        puts "Advert #{advert.title} was successfully published."
      else
        puts "Error with #{advert.title}"
      end
    end
  end
end
