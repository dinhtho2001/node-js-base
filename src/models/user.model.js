
import { INTEGER, STRING, TEXT, DATE } from 'sequelize';
import { sequelize } from '../db/index.js';
import UserAddress from './user-address.model.js';

const User = sequelize.define("user", {
    id: {
        type: INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
    },
    username: {
        type: STRING(255),
        allowNull: false,
        unique: true
    },
    password: {
        type: STRING(255),
        allowNull: false
    },
    firstName: {
        type: STRING(255),
        field: 'first_name'
    },
    lastName: {
        type: STRING(255),
        field: 'last_name'
    },
    email: {
        type: TEXT,
    },
    telephone: {
        type: STRING(11)
    },
    createdAt: {
        type: DATE,
        field: 'created_at'
    },
    modifiedAt: {
        type: DATE,
        field: 'modified_at'
    }
}, { tableName: 'user' }
);

User.hasMany(UserAddress, {
    foreignKey: 'userId'
});
UserAddress.belongsTo(User);

export default User;