# Set up Postgres

initdb /usr/local/var/postgres

# set up launch agent?
# cp /usr/local/Cellar/postgresql/$pg_latest/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
# launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
# pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
# createdb?
