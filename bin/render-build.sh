# Conteúdo do render-build.sh
bundle install
bundle lock --add-platform x86_64-linux
bundle exec rails assets:precompile
bundle exec rails assets:clean