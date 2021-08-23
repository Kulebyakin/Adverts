# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


# set :bundle_command, 'bundle exec'
set :environment, "development"
set :output, "log/cron.log"

every :day, at: '00:00 am' do
  runner "Cron.publish_all_accepted_adverts"
end

every :day, at: '23:50 am' do
  runner "Cron.archive_all_published_more_than_3_days_ago_adverts"
end


