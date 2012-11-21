worker_processes 3
timeout 30
preload_app true

after_fork do |server, worker|
  ::NewRelic::Agent.after_fork(:force_reconnect => true) if defined? Unicorn
end
