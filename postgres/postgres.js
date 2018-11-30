#!/usr/bin/env node

const path = require('path');
const fs = require('fs');
const yargs = require('yargs');
const handlebars = require('handlebars');

// Templates
const templates = {
  change_user_password : handlebars.compile(fs.readFileSync(path.join(__dirname, 'template', 'change_user_password.sql')).toString()),
  bootstrap            : handlebars.compile(fs.readFileSync(path.join(__dirname, 'template', 'bootstrap.sql')).toString()),
  create_service_user  : handlebars.compile(fs.readFileSync(path.join(__dirname, 'template', 'create_service_user.sql')).toString()),
  create_user          : handlebars.compile(fs.readFileSync(path.join(__dirname, 'template', 'create_user.sql')).toString()),
};

// Change user password
const changeUserPassword = {
  arguments: {
    username: {
      alias       : 'u',
      description : 'Username of the user',
      required    : true
    },
    password: {
      alias       : 'p',
      description : 'New password for the user',
      required    : true
    },
  },
  handler: (argv) => {
    console.log(templates.change_user_password({
      user     : argv.username,
      password : argv.password,
    }));
  },
};

// Bootstrap
const bootstrap = {
  arguments: {
    database: {
      description : 'The database to run bootstrap on',
      required    : true,
    },
    schema: {
      description : 'The schema within selected database to run bootstrap on',
      default     : 'public'
    },
  },
  handler: (argv) => {
    console.log(templates.bootstrap({
      database : argv.database,
      schema   : argv.schema,
    }));
  },
};

// Create service user
const createServiceUser = {
  arguments: {
    username: {
      alias       : 'u',
      description : 'Username of the user',
      required    : true
    },
    password: {
      alias: 'p',
      description : 'New password for the user',
      required: true
    },
    database: {
      description : 'The database to run bootstrap on',
      required    : true,
    },
    schema: {
      description : 'The schema within selected database to run bootstrap on',
      default     : 'public'
    },
  },
  handler: (argv) => {
    console.log(templates.create_service_user({
      user     : argv.username,
      password : argv.password,
      database : argv.database,
      schema   : argv.schema,
    }));
  },
};

// Create user
const createUser = {
  arguments: {
    username: {
      alias       : 'u',
      description : 'Username of the user',
      required    : true
    },
    password: {
      alias       : 'p',
      description : 'New password for the user',
      required    : true
    },
    role: {
      description : 'Role of the user',
      choices     : ['administrator', 'operator', 'developer'],
      required    : true
    },
  },
  handler: (argv) => {
    console.log(templates.create_user({
      user     : argv.username,
      password : argv.password,
      role     : argv.role,
      database : argv.database,
      schema   : argv.schema,
    }));
  },
};

// Parse argument and run command
yargs
  .usage('$0 [options] [command]', 'Helper program that generate SQL scripts to manage Postgres')
  .command('change_user_password', 'Generate a SQL script to change password for a database user',
    changeUserPassword.arguments,
    changeUserPassword.handler,
  )
  .command('bootstrap', 'Generate a SQL script to bootstrap with default roles',
    bootstrap.arguments,
    bootstrap.handler,
  )
  .command('create_service_user', 'Generate a SQL script to create a database user for service',
    createServiceUser.arguments,
    createServiceUser.handler,
  )
  .command('create_user', 'Generate a SQL script to create a database user for human',
    createUser.arguments,
    createUser.handler,
  )
  .version('1.0.0')
  .help()
  .argv;
