FROM ruby:3.0.7

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn sqlite3

# Set an environment variable to reduce warnings
ENV BUNDLE_PATH /gems

# Create and set the working directory
RUN mkdir /app
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler && bundle install

# Install Rails globally
RUN gem install rails

# Copy the rest of the application code
COPY . .

# Ensure the Rails binary is in the PATH
ENV PATH /gems/bin:$PATH

# Expose port 3000
EXPOSE 3000

# Run the server
CMD ["rails", "server", "-b", "0.0.0.0"]
