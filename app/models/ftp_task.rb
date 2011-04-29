class FtpTask < Task
  validates_presence_of :server, :login, :password, :files  
end