import Config
import Dotenvy

source!([".env", ".env.development", ".env.dev", System.get_env()])

#config :logger,
#  level: env!("LILITH_LOG_LEVEL", :string?) || "info"

config :lilith,
  port: env!("LILITH_PORT", :integer?) || "5489"

config :nostrum,
  token: env!("LILITH_DISCORD_TOKEN", :string),
  gateway_intents: [
    :guilds,
    :guild_messages,
    :message_content,
    :guild_presences
  ]
