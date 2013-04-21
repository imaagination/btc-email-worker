require 'active_support/core_ext'
require 'action_mailer'
require 'models/mailer'

config = YAML.load_file("settings.yml")

# Set up ActionMailer
ActionMailer::Base.smtp_settings = config['sendgrid'].inject({}) { |memo, (k, v)| memo[k.to_sym] = v; memo }

ActionMailer::Base.view_paths = ['.']

Mailer.email_alert(payload).deliver!
