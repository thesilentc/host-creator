<h2>Host Creator</h2>

You'll need to  `cd host-creator/host-creator` before running `shotgun` in your terminal

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
-config
-db
-spec
...
```
