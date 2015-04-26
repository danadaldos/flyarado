class FlowReadingImportWorker
  @queue = :flow_reading_import_worker

  def self.perform
    FlowReading.get_data
  end
end
