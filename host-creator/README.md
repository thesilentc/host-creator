## Host Creator

Host Creator is a database project written using Sinatra ActiveRecord. It has the ability for users to sign-up, login, create robotic hosts, and even allows a user to decide the temperament of their hosts by assigning them either a White hat or a Black Hat. Users may view all the created hosts ever created, but may only update and otherwise destroy hosts of their own creation.

## Usage

After cloning into the repository please access the app by changing into the directory by typing:

  $ cd host-creator/host-creator

Then run

  $ bundle install

And finally starting your server and then going to the appropriate port on the localhost

The MVC file structure looks like this:

```bash
-app
  |- controllers
      |- application_controller.rb
      |- hosts_controller.rb
      |- users_controller.rb
  |- models
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
