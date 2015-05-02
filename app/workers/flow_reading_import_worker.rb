class FlowReadingImportWorker
  @queue = :flow_reading_import_worker

  def self.perform
    FlowReading.get_data
    Resque.enqueue_in(1.hour, FlowReadingImportWorker)
  end
end
