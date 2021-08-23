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

  def self.archive_all_published_more_than_3_days_ago_adverts
    adverts = Advert.where(status: :published)
    adverts.each do |advert|
      advert.archive if advert.updated_at < Time.now - 3.days + 10.minutes
    end

    adverts.each do |advert| 
      if advert.save
        puts "Advert #{advert.title} was successfully archived."
      else
        puts "Error with #{advert.title}"
      end
    end
  end
end
