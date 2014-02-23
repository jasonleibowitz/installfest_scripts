# Set up Postgres

# Create a database
initdb /usr/local/var/postgres -E utf8
createdb ${USER}
# Ensure that Postgres launches whenever we login
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.*/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
# Start Postgres now
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
