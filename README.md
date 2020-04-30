# threaded-sinatra
Testing Threaded use of Sinatra

# Testing on Windows

```powershell
docker build -t threaded-sinatra .
docker run -it --rm -p 80:4567 --volume ${PWD}:/app threaded-sinatra /bin/bash

bundle install
bundle exec ruby racktest.rb
```
