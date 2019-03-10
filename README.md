## Host Creator

Host Creator is a database project written using Sinatra and ActiveRecord. It has the ability for users to sign-up, login, and create robotic hosts. Users are allowed to decide the temperament of their hosts by assigning them either a White hat or a Black Hat. A user may view all the hosts created by all users. However, users may only update and otherwise destroy hosts of their own creation.

## Usage


After cloning into the repository please access the app by changing into the directory with:

```cd host-creator/host-creator```

Then run
```bundle install```


Migrate the databases by running

```db:migrate```


To see the application in your browser, run

```shotgun```


and then go to the following address in your browser

http://localhost:9393/



The MVC file structure looks like this:

```bash
-app
  |- controllers
      |- application_controller.rb
      |- hosts_controller.rb
      |- users_controller.rb
  |- models
      |- hat.rb
      |- hosts.rb
      |- user.rb

  |- views
      |- layout.erb
      |- welcome.erb
      |- hosts
          |- create_host.erb
          |- edit_host.erb
          |- hosts.erb
          |- show_hosts.erb
      |- users
            |- create_user.erb
            |- login.erb
            |- show.erb
...
```
