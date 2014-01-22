# Set up Postgres


## PL: Need to confirm these steps.
# initdb /usr/local/var/postgres -E utf8
# declare pg_latest="9.3.2"
# # Create a database
# initdb /usr/local/var/postgres -E utf8
# # Ensure that Postgres launches whenever we login
# mkdir -p ~/Library/LaunchAgents
# cp /usr/local/Cellar/postgresql/$pg_latest/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
# # Start Postgres now
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
