require 'fcntl'
module Puma
  module Util
    module_function
    def pipe
      a,b = IO.pipe
      a_flag = a.fcntl(Fcntl::F_GETFD, 0)
      b_flag = b.fcntl(Fcntl::F_GETFD, 0)
      a.fcntl(Fcntl::F_SETFD, a_flag | Fcntl::FD_CLOEXEC)
      b.fcntl(Fcntl::F_SETFD, b_flag | Fcntl::FD_CLOEXEC)
      [a,b]
    end
  end
end
