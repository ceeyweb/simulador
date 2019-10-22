FROM ruby:2.5.3

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    mysql-client \
    tzdata \
    nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/*

# Set environement variables
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

# Create app directory
RUN mkdir -p /pms
WORKDIR /pms

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler \
&& bundle install --without development test --jobs 20 --retry 5

# Copy app code
COPY . ./

# Add container startup commands file
COPY .docker/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify app port
EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
