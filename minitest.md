# Minitest

## Resources

* [Cheat Sheet (RubyPigeon)](https://www.rubypigeon.com/posts/minitest-cheat-sheet/)
* [Middleware](https://gist.github.com/radavis/be012e387ba93ace94f0992bb784466a)

## Apps/Libs that use Minitest

* [RubyGems](https://github.com/rubygems/rubygems/)
* [OpenStreetMap](https://github.com/openstreetmap/openstreetmap-website)
* [Sidekiq](https://github.com/mperham/sidekiq/)

## Examples

### OpenStreetMap (uses `factorybot`)

- `app/report.rb`: [model](https://github.com/openstreetmap/openstreetmap-website/blob/master/app/models/report.rb), [test](https://github.com/openstreetmap/openstreetmap-website/blob/master/test/models/report_test.rb)
- `app/node.rb`: [model](https://github.com/openstreetmap/openstreetmap-website/blob/master/app/models/node.rb), [test](https://github.com/openstreetmap/openstreetmap-website/blob/master/test/models/node_test.rb)
- `app/user.rb`: [model](https://github.com/openstreetmap/openstreetmap-website/blob/master/app/models/user.rb), [test](https://github.com/openstreetmap/openstreetmap-website/blob/master/test/models/user_test.rb)

### Sidekiq

- `lib/sidekiq/middleware/chain.rb`: [class](https://github.com/mperham/sidekiq/blob/main/lib/sidekiq/middleware/chain.rb), [test](https://github.com/mperham/sidekiq/blob/main/test/test_middleware.rb)

### Sinatra

- `README.md`: [document](https://github.com/sinatra/sinatra/blob/master/README.md), [test](https://github.com/sinatra/sinatra/blob/master/test/readme_test.rb)
- `Request`: [class](https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb), [test](https://github.com/sinatra/sinatra/blob/master/test/request_test.rb)
- `Base`: [class](https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb), [test](https://github.com/sinatra/sinatra/blob/master/test/base_test.rb)
