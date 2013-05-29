# This class represents the authentication scheme - name and password.
module EasyWebService
  module RequestHandler
    class Http
      module Authentication
        require 'easy_web_service/request_handler/http/authentication/base'

        class NameAndPassword < Base
          def generate_credentials_for(app_name)
            @credentials[:app_name] = app_name
            @credentials[:app_secret] = EasyWebService::Setting.authentication(app_name, "name_and_password").password
            self
          end
        end
      end
    end
  end
end
