# Produciton.com

Produciton is a to-do list for launching your application into production.

Choose from among various pre-filled production checklists, fork them, and tweak
them to match your desired workflow. Then use them going forward to make sure
you don't forget anything.

For instance, when deploying a Rails app:

- SSL
- Backups
- Test backup restore
- Continuous Integration
- Continuous Deployment
- Error monitoring service
- Application monitoring service
- Uptime monitoring
- CDN
- Security audit solution (Brakeman, Gemnasium, etc)
- ...

## Development

To get started with development:

### Clone the repo

```sh
git clone git@github.com:dailydrip/produciton.com
```

### Install dependencies

```sh
bundle
```

### Setup the database

```sh
rake db:setup
```

### Run the tests

```sh
rake
```

### Run the app

```sh
rails s
```

Then visit <http://localhost:3000>

## License

Produciton.com is [MIT Licensed](./LICENSE).
