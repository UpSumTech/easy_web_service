# This class acts as a registrar for various authentication schemes.
# You can not use a authentication scheme if you have not registered it.
module EasyWebService
  class AuthenticationSchemeRegistrar
    def initialize
      @schemes = Hash.new do |hash, key|
        begin
          "EasyWebService::RequestHandler::#{key.to_s.camelize}".constantize
        rescue NameError
          raise EasyWebService::StrategyNotFoundError.new(key)
        end
        hash[key] = {}
      end
    end

    def register(scheme, strategy)
      @schemes[strategy.to_sym][scheme.to_sym] = scheme(scheme, strategy)
      self
    end

    def get(scheme, strategy)
      raise EasyWebService::StrategyNotFoundError.new(strategy) unless @schemes.has_key?(strategy.to_sym)
      begin
        @schemes.fetch(strategy.to_sym).fetch(scheme.to_s.to_sym)
      rescue IndexError
        scheme(:base, strategy)
      end
    end

    private

    def scheme(scheme, strategy)
      "EasyWebService::RequestHandler::#{strategy.to_s.camelize}::Authentication::#{scheme.to_s.camelize}".constantize.new
    end
  end
end
