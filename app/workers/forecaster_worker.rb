class ForecasterWorker
  @queue = :forecaster_worker

  def self.perform
    Rails.logger.debug "Getting Weather"
    Services::Forecaster.run
    Resque.enqueue_at(1.day.from_now.at_midnight+5.minutes, ForecasterWorker)
  end
end

# To begin this job in Heroku enable the following:
# Resque.enqueue_in(2.seconds, ForecasterWorker)

