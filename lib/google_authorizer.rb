require "google_authorizer/version"
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module GoogleAuthorizer

  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
  CLIENT_SECRETS_PATH = 'client_secret.json'

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or initiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def authorize_scope(scope, filename)
    credentials_path = File.join(Dir.home, '.credentials', "#{filename}.yaml")

    FileUtils.mkdir_p(File.dirname(credentials_path))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: credentials_path)
    authorizer = Google::Auth::UserAuthorizer.new(
        client_id, scope, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(
          base_url: OOB_URI)
      puts 'Open the following URL in the browser and enter the ' +
               'resulting code after authorization'
      puts url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI)
    end
    credentials
  end

end
