import { INTEGER, STRING, TEXT, DATE } from 'sequelize';
import { sequelize } from '../db/index.js';
import User from './user.model.js';

const UserAddress = sequelize.define("user_address", {
    id: {
        type: INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
    },
    userId: {
        type: INTEGER,
        allowNull: false,
        // unique: true,
        field: 'user_id'
    },
    address: {
        type: TEXT,
        allowNull: false
    },
    city: {
        allowNull: false,
        type: STRING(255)
    },
    district: {
        allowNull: false,
        type: STRING(255)
    },
    ward: {
        allowNull: false,
        type: STRING(255)
    },
    telephone: {
        allowNull: false,
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
}, { tableName: 'user_address', freezeTableName: true }
);

export default UserAddress;