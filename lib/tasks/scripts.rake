namespace :scripts do

  desc "Execute scripts where schedule is every_hour"
  task run_hourly_scripts: :environment do
    scripts = Script.where(schedule: :every_hour)

    scripts.each do |script|
      puts "Executing script ##{script.id}"
      begin
        @b = SafeBinding.new
        @bb = @b.get_binding

        timeout_in_seconds = 10
        Timeout::timeout(timeout_in_seconds) do
          eval(script.content, @bb)
        end
      rescue Exception => e
        puts "Error in script: #{e.inspect}"
        @b.errors = ["An error has occured. #{e.inspect}"]
      end
    end
  end

end
