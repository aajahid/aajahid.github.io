FROM ruby:3.2

# Set working directory
WORKDIR /srv/jekyll

# Install dependencies including Node.js for JavaScript runtime
RUN apt-get update && \
    apt-get install -y build-essential curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install latest bundler
RUN gem install bundler

# Copy Gemfile first (for better caching)
COPY Gemfile ./

# Remove old Gemfile.lock if it exists (to regenerate with new Jekyll version)
RUN rm -f Gemfile.lock

# Install gems (this will generate a new Gemfile.lock with compatible versions)
RUN bundle install

# Copy the rest of the project
COPY . .

# Expose Jekyll's default port and live reload port
EXPOSE 4000 35729

# Default command: serve with development config and live reload
CMD ["bundle", "exec", "jekyll", "serve", "--config", "_config_dev.yml", "--host", "0.0.0.0", "--livereload", "--force_polling"]
