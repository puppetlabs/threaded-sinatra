# threaded-sinatra

Testing threaded use of Sinatra

The problem we are trying to solve here is the launching of a Sinatra
application on a new thread that includes prometheus metrics.

## Testing on Windows

```powershell
docker build -t threaded-sinatra .
docker run -it --rm -p 80:4567 --volume ${PWD}:/app threaded-sinatra /bin/bash

bundle install
bundle exec ruby racktest.rb
```

## Testing in Vagrant without a volume mount

```bash
vagrant up
vagrant ssh
cd /vagrant
docker build -t threaded-sinatra .
docker run -it --rm -p 4567:4567 threaded-sinatra jruby racktest.rb api
```

You can try out the various endpoints in your local browser:

- http://localhost:4567/api
- http://localhost:4567/foo
- http://localhost:4567/prometheus
