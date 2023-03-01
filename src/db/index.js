import Sequelize from "sequelize";

const sequelize = new Sequelize('railway', 'postgres', 'postgres', {
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