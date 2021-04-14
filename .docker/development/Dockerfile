FROM ruby:2.5.3

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    mysql-client \
    tzdata \
    nodejs \
    shared-mime-info \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/*

# Set environement variables
ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES false

# Create app directory
RUN mkdir -p /pms
WORKDIR /pms

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --retry 5

# Copy app code
COPY . ./

# Add container startup commands file
COPY .docker/development/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify app port
EXPOSE 3000

# Start the main process
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
