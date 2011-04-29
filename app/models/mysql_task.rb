class MysqlTask < Task
  validates_presence_of :server, :login, :password, :sql  
end