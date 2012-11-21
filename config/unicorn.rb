worker_processes 1
timeout 30
preload_app true

before_fork do |server, worker|
  Rails.cache.reconnect
  sleep 1
end

after_fork do |server, worker|
  ::NewRelic::Agent.after_fork(:force_reconnect => true) if defined? Unicorn
end
