# Encoding: UTF-8

attrs = node['resource_tweetbot_app_test']

tweetbot_app attrs['name'] do
  action attrs['action'] unless attrs['action'].nil?
end
