worker_processes 1
timeout 30
preload_app true

before_fork do |server, worker|
  Rails.cache.reconnect
  sleep 1
end

after_fork do |server, worker|
end
