# Conteúdo do render-build.sh
bundle install
bundle exec rails db:migrate RAILS_ENV=production
bundle lock --add-platform x86_64-linux
bundle exec rails assets:precompile
bundle exec rails assets:clean