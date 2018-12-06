class ApplicationService
  attr_reader :result, :success, :errors
  alias :success? :success

  # this is common service interface, every services should be inherited from it
  class <<self
    def call(*args)
      obj = new(*args)
      obj.call
      obj
    end
  end
end
