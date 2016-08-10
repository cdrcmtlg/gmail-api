# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, '652328274201-9v3scc1vvjjmbvkc5a1s9kb7qc8ujgpn.apps.googleusercontent.com', 'KblPGLAvaS4xtQEOQ1c2nrK_', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
# end

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '652328274201-9v3scc1vvjjmbvkc5a1s9kb7qc8ujgpn.apps.googleusercontent.com', 'KblPGLAvaS4xtQEOQ1c2nrK_', {
    scope: ['https://mail.google.com/','contacts','plus.login','plus.me','userinfo.email','userinfo.profile']
  }
end