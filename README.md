# Manage My Money Server
 *Manage My Money* is a simple application to record your income and expenses. It demonstrates best practices in developing applications using Node.js, REST and [Bookshelf](http://bookshelfjs.org/). The application is based on the [Node REST Template](https://github.com/archfirst/node-rest-template) to provide the basic application structure and build system.

## Requirements

- Install Node
    - on OSX, install [home brew](http://brew.sh/) and type `brew install node`
    - on Windows, use the installer available at [nodejs.org](http://nodejs.org/)

- Install Postgres and postgresql93-devel (development header files and libraries)

- Create a database called `manage-my-money` and create the tables needed by the app

        $ cd sql
        $ psql manage-my-money
        manage-my-money=# \i create-schema.sql
        manage-my-money=# \i load-data.sql

- Open a terminal (command line) window

- Type `npm install -g node-inspector node-gyp gulp bunyan`
    - node-gyp is required for `npm install` to succeed
    - bunyan is required for displaying the application log file in a human readable format

- Clone this repo

- Make sure that `server/infrastructure/orm.js` has the correct database parameters

## Quick Start
Run the application locally:
```bash
$ npm install
$ gulp serve
```
- `npm install` will install the required node libraries under `node_modules`.
- `gulp serve` will start the application. It is designed for an efficient development process. As you make changes to the code, the application will restart to reflect the changes immediately.

To verify that the application is working correctly, point your browser to [http://localhost:8080/accounts](http://localhost:8080/accounts) - you should see a response with a list of accounts in JSON format.

When you deploy the application to a production environment, run the following command to start it without using gulp:

    $ node server/server.js | bunyan -o short

A better way to run the application in production is to start it using forever. This will automatically restart the application in case of a failure:

    $ forever start server/server.js | bunyan -o short

- To debug the application use node-debug (start node-debug on port 9090 because the application itself uses the default port 8080)

    $ node-debug --web-port 9090 server/server.js | bunyan -o short

## Folder Structure

### Highest Level Structure

```
/domain-model
/node_modules
/server
/sql
/test
```

- `domain-model`: A diagram showing the entities and their relationships in the application's business domain.
- `node_modules:` Node.js modules downloaded by `npm install` (do not check in)
- `server:` contains all the source files for the RESTful server
- `sql`: scripts for creating the database schema and loading data
- `test:` server tests

### Serve Folder Structure

```
/server
    /adapters
    /application
    /domain
    /infrastructure
    /public
    /server.js
```

The `server` folder contains the source for the RESTful server. `server.js` is the startup script. Below this you will find various folders that arrange the application into logical layers as suggested by the [Hexagonal architecture](http://alistair.cockburn.us/Hexagonal+architecture) (a.k.a. the [Onion Architecture](http://jeffreypalermo.com/blog/the-onion-architecture-part-1/)):

- `adapters` is the outermost layer that *adapts* the external world (in this case the incoming HTTP messages) to the application layer. This is the layer that provides the RESTful API.

- The `application` layer coordinates application activities such as creation of the domain objects and calling their methods in response to external requests.

- The `domain` layer encapsulate the state and behavior of the application's business domain. It consists of entities and value objects. See [this article](https://archfirst.org/domain-driven-design/) for a detailed description of the domain layer. We use an Object-Relational Mapping (ORM) tool called [Bookshelf](http://bookshelfjs.org/) to persist our entities to a SQL database.

- The `infrastructure` folder contains facilities such as initialization and logging that support all layers of the application.

- The `public` folder contains a simple web page to display the name of the application. Since the primary purpose of this server is to expose a RESTful API, we do not expect to add any more functionality to this folder.

## Tasks

### Task Listing

- `gulp help`

    Displays all of the available gulp tasks.

### Code Analysis

- `gulp vet`

    Performs static code analysis on all javascript files. Runs jshint and jscs.

- `gulp vet --verbose`

    Displays all files affected and extended information about the code analysis.

### Testing

- `gulp test`

    Runs all acceptance tests using cucumber. Depends on vet task, for code analysis. Note that this task will alter the database. To resume normal operation of the application, you must reload the data.

- `gulp autotest`

    Run tests whenever source or test files change.

### Run application for development

- `gulp serve`

    Runs the application using gulp. As you make changes to the code, the application will restart to reflect the changes immediately.

- `node-debug --web-port 9090 server/server.js`

   Launch the application in debug mode.

- `gulp serve --debug` (TODO: fix this - it is not working)

    Launch debugger with node-inspector.

- `gulp serve --debug-brk` (TODO: fix this - it is not working)

    Launch debugger and break on 1st line with node-inspector.

### Run application in production mode

- `node server/server.js | bunyan -o short`

or Use `forever` to automatically restart the application in case of a failure:

- `forever start server/server.js | bunyan -o short`