class Task < ActiveRecord::Base
  #STI Class
  
  #avoid type field warnings like:
  # warning: Object#type is deprecated; use Object#class
  self.inheritance_column = :task_type
  
  #dynamic creation of any types of tasks
  #http://railsforum.com/viewtopic.php?id=3815
  def self.factory(type, params = nil)
    class_name = type
    object=class_name.constantize.new(params)    
  end
  
  #http://code.alexreisner.com/articles/single-table-inheritance-in-rails.html
  # avoid errors like:
  # NoMethodError (undefined method `ftp_task_url' for #<TasksController:0x1035e4760>):
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Task.model_name
      end
    end
    super
  end
    
end
