# This class deals with the api key authentication scheme.
module EasyWebService
  module RequestHandler
    class Http
      module Authentication
        require 'easy_web_service/request_handler/http/authentication/base'

        class ApiKey < Base
          def generate_credentials_for(app_name)
            @credentials[:api_key] = EasyWebService::Setting.authentication(app_name, "api_key").api_key
            self
          end
        end
      end
    end
  end
end
