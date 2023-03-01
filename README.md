# The node.js example app

## Requirements

* Node latest version
* Git
* Postgresql

## Prepare postgresql
- [Download and install postgresql](https://www.postgresql.org/download/)

- Create database **railway**

- Restore database

## Connect database
Path /src/db/index.js

Change database name, username, password.

```javascript
import Sequelize from "sequelize";

const sequelize = new Sequelize('databaseName', 'username', 'password', {
    dialect: "postgres",
    define: {
        timestamps: false
    },
    port: 5432,
    host: 'localhost',
    logging: false
});

export {
    sequelize,
    Sequelize
}
```
[Reference](https://sequelize.org/docs/v6/getting-started/#connecting-to-a-database)

## Common setup

Open source and install the dependencies.

```bash
npm install
```

To start the express server, run the following

```bash
npm run start
```