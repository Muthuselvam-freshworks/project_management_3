class DeleteTasksWorker 
  include Sidekiq::Worker

  def perform(task_ids)
    Task.where(id: task_ids).destroy_all
  end
end
