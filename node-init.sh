#!/bin/bash

mkdir new-blinking-node
cd new-blinking-node

npm init -y

mkdir src
cd src

mkdir api entities repositories router services utils
touch utils/env-wrapper.ts
touch app.ts
cd ..
touch ormconfig.ts
touch main.ts
touch ./.env

FILE="./ormconfig.ts"

/bin/cat <<EOM >$FILE
import { env } from "./src/utils/env-wrapper";
 
export default {
    type: "postgres",
    host: env.pg.host,
    port: env.pg.port,
    username: env.pg.username,
    password: env.pg.password,
    database: env.pg.database,
    synchronize: env.orm.synchronize,
    logging: env.orm.logging,
    entities: [
        "src/entities/**/*.ts"
    ],
    migrations: [
        "src/migration/**/*.ts"
    ],
    subscribers: [
        "src/subscriber/**/*.ts"
    ],
    cli: {
        "entitiesDir": "src/entities",
        "migrationsDir": "src/migration",
        "subscribersDir": "src/subscriber"
    }
}
EOM

FILE="./.env"

/bin/cat <<EOM >$FILE
# Server Properties
port=8080

# Database Properties
pg_host=localhost
pg_port=5432
pg_username=postgres
pg_password=root
pg_db_name=insert_name

# ORM Properties
orm_synchronize=true
orm_logging=true
EOM

FILE="./src/utils/env-wrapper.ts"

/bin/cat <<EOM >$FILE
class EnvWrapper {
 
    public port = this.getProperty("port");
 
    public pg = {
        host: this.getProperty("pg_host"),
        port: this.toNumber(this.getProperty("pg_port")),
        username: this.getProperty("pg_username"),
        password: this.getProperty("pg_password"),
        database: this.getProperty("pg_db_name"),
    }
 
    public orm = {
        synchronize: this.toBoolean(this.getProperty("orm_synchronize")),
        logging: this.toBoolean(this.getProperty("orm_logging"))
    }
 
    private getProperty(property: string): string {
        return process.env[property.toUpperCase()] || process.env[property.toLowerCase()] || "";
    }
 
    private toNumber(value: string): number {
        return +value;
    }
 
    private toBoolean(value: string): boolean {
        return value.toLowerCase() === "true";
    }
 
}
 
export const env = new EnvWrapper();
EOM


npm install --save express body-parser pg typeorm
npm install --save-dev typescript ts-node @types/node@10.17.51 @types/body-parser

echo "Node initialized"

code .