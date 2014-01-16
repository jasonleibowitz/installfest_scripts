declare ruby_version="2.1.0"
declare ruby_check=$(rbenv versions | grep $ruby_version)
if [[ "$ruby_check" == *$ruby_version* ]]; then
  echo "$ruby_version is installed"
fi
