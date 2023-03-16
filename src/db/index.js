import Sequelize from "sequelize";

const sequelize = new Sequelize('railway', 'postgres', 'DDDhYXBgNJpNlvByMWH1', {
    dialect: "postgres",
    define: {
        timestamps: false
    },
    port: 6683,
    host: 'localhost',
    logging: false
});

export {
    sequelize,
    Sequelize
}