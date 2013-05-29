module EasyWebService
  class EasyWebServiceError < StandardError
  end

  class RequestError < EasyWebServiceError
    def initialize(response)
      super(response.response.message)
    end
  end

  class StrategyNotFoundError < EasyWebServiceError
    def initialize(strategy)
      super(strategy.to_s + " is not registered as a strategy")
    end
  end

  class AuthenticationSchemeNotFoundError < EasyWebServiceError
    def initialize(scheme, strategy)
      super(scheme.to_s + " is not registered as an authentication scheme for " + strategy.to_s)
    end
  end

  class ActionNotFoundError < EasyWebServiceError
    def initialize(action, strategy)
      super(action.to_s + " is not registered as an action for " + strategy.to_s)
    end
  end
end
