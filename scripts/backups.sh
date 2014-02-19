# Backup any import files students may already have set.
# In home directory
for file in .gitconfig .gitignore_global .bash_profile .bashrc .gemrc .pryrc .rspec .irbrc; do
  if [ -a "${HOME}/${file}" ]; then
    cp "${HOME}/${file}" "${HOME}/${file}.bk"
  fi
done

# Sublime Settings
