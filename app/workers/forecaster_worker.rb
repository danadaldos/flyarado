class ForecasterWorker
  @queue = :forecaster_worker

  def self.perform
    Rails.logger.debug "Getting Weather"
    Services::Forecaster.run
    Resque.enqueue_in(10.seconds, ForecasterWorker)
  end
end

Resque.enqueue_in(2.seconds, ForecasterWorker)
