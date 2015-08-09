# docker run --rm -it ubuntu:latest

RUBY_MAJOR_VERSION="2.2"
RUBY_VERSION="2.2.2"
NODE_VERSION="v0.12.7"

# Update apt repositories & upgrade any outdated system components
apt-get -y update
apt-get -y upgrade

# Install Ruby dependencies
apt-get -y install \
  build-essential \
  git-core \
  libcurl4-openssl-dev \
  libffi-dev \
  libreadline-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  wget \
  zlib1g-dev

cd /usr/local/src
curl -o ruby-$RUBY_VERSION.tar.gz http://ftp.ruby-lang.org/pub/ruby/$RUBY_MAJOR_VERSION/ruby-$RUBY_VERSION.tar.gz
tar -xzvf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION
./configure
make
make install
ruby -v
# ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-linux]

cd /usr/local/src
curl -o node-$NODE_VERSION.tar.gz https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION.tar.gz
tar -zxf node-$NODE_VERSION.tar.gz
cd node-$NODE_VERSION
./configure
make
make install
node -v
# v0.12.7

curl -L https://npmjs.com/install.sh | sh
npm -v
# 2.13.4

# Clean up
rm -rf /usr/local/src/*
