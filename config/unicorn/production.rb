app_root = '/var/u/apps/projectlog'

worker_processes 5
working_directory "#{app_root}/current"
preload_app true
timeout 300
listen "#{app_root}/shared/sockets/unicorn.sock", backlog: 2048

pid "#{app_root}/shared/pids/unicorn.pid"
stderr_path "#{app_root}/current/log/unicorn.log"
stdout_path "#{app_root}/current/log/unicorn.log"

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

# handle zero-downtime restarts

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |_server, _worker|
  # set process title to application name and git revision
  revision_file =
    "#{Rails.root}/REVISION"
  if ENV['RAILS_ENV'] != 'development' && File.exist?(revision_file)
    ENV['UNICORN_PROCTITLE'] = 'unicorn ' + File.read(revision_file)[0, 6]
    $0 = ENV['UNICORN_PROCTITLE']
  end

  # reset sockets created before forking
  ActiveRecord::Base.establish_connection
end

before_exec { |_server| Dir.chdir("#{app_root}/current") } # listen 4600
