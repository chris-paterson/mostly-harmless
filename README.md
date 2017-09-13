# Mostly Harmless

Mostly Harmless is your one-stop-shop for all of your off-worldly needs.

## Setting up PostgreSQL

### macOS - brew

1. Install: `$ brew install postgresql`
2. Start: `$ brew services start postgresql`
3. Log in: `$ psql postgres`
4. Create a role with the ability to login and create databases: `# CREATE ROLE postgres LOGIN CREATEDB;`
5. `# ALTER USER postgres WITH SUPERUSER;`

## Starting the server

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Testing
Before running integration tests we need to start phantomjs in a different terminal window. 

`phantomjs --wd`
