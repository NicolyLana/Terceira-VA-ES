rem Conteúdo do render-build.sh
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean