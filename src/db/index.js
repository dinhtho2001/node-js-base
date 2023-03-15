import Sequelize, { Model } from "sequelize";

const sequelize = new Sequelize('railway', 'postgres', 'DDDhYXBgNJpNlvByMWH1', {
    dialect: "postgres",
    define: {
        timestamps: false
    },
    port: 6683,
    host: 'localhost',
    logging: false
});


//  user = require("../models/user.model.js")(sequelize, Sequelize);
//  userAddress = require("../models/user-address.model.js")(sequelize, Sequelize);

// User.hasMany(UserAddress, { as: "userAddresses" });
// UserAddress.belongsTo(User, {
//     foreignKey: "id",
//     as: "user",
// });

export {
    sequelize,
    Sequelize
}
// module.exports={
//     sequelize,
//      Sequelize,    db
// };