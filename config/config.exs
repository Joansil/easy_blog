# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :easy_blog,
  ecto_repos: [EasyBlog.Repo]

# Configures the endpoint
config :easy_blog, EasyBlogWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: EasyBlogWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: EasyBlog.PubSub,
  live_view: [signing_salt: "CchZ+/eV"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :easy_blog, EasyBlog.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian config
config :easy_blog, EasyBlog.Guardian,
  issuer: "easy_blog",
  secret_key: "xQBIXZyMr00eVlpOB90d1TGBeWA71tjyXJ+ccHvFcMaBoIjLQ3YItwWRR4ut3ax+"


# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
