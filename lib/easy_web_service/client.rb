(Dir.glob(File.dirname(__FILE__) + "/*.rb") - [__FILE__]).map {|obj| obj.gsub(/\.rb/, '')}.each do |file_path|
  require file_path
end

class EasyWebService::Client
  def initialize(options)
    @app = options.fetch(:app)
    @version = options.fetch(:version)
    @request_strategy_registrar = EasyWebService::RequestStrategyRegistrar.new
    @authentication_scheme_registrar = EasyWebService::AuthenticationSchemeRegistrar.new
  end

  def register_strategy(strategy)
    @request_strategy_registrar.register(strategy)
    self
  end

  def register_authentication_scheme(strategy, scheme)
    @authentication_scheme_registrar.register(scheme, strategy)
    self
  end

  def register_actions(strategy, actions)
    @request_strategy_registrar.get(strategy).register_actions(actions)
    self
  end

  def request(options)
    authentication_scheme = @authentication_scheme_registrar.get(options[:authenticate_via], options.fetch(:via))
    request = EasyWebService::Request.new(@app, @version, authentication_scheme)
    request.set_resource_details(options.fetch(:for), options.fetch(:action))
    @request_strategy_registrar.get(options.fetch(:via)).perform(request)
  end
end
