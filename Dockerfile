FROM ruby:2.7.2

ENV BUNDLER_VERSION=2.0.2

RUN apt-get update

RUN apt-get install -y \
      nodejs \
      postgresql \
      npm

RUN npm install -g yarn

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
