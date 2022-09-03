$LOAD_PATH.unshift File.dirname(__FILE__)

require 'webrick'
require 'sidekiq-failures-example'
require 'sidekiq/web'

GoodWorker.perform_async('good')
GoodWorker.perform_async('good')
GoodWorker.perform_async('good')

BadWorker.perform_async('bad')
BadWorker.perform_async('bad')
use Rack::Session::Cookie, secret: File.read(".session.key"), same_site: true, max_age: 8640
run Sidekiq::Web
