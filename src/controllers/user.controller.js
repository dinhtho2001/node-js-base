
import bcrypt from "bcryptjs";
import User from "../models/user.model.js"
import UserAddress from "../models/user-address.model.js"

class UserController {
    getAll(req, res) {
        User.findAll()
            .then(posts => res.status(200).json(posts))
            .catch(err => res.status(400).json({ err }));
    }

    create(req, res) {
        // check user and password are required
        // check user is already exist
        const cryptPassword = bcrypt.hashSync(req.body.password, 8);
        req.body.password = cryptPassword;
        User.create(req.body)
            .then(result => res.status(200).json(result))
            .catch(err => res.status(401).send(err.message));
    }

    findOne(req, res) {
        const id = req.params.id;
        User.findByPk(id)
            .then(data => {
                if (!data) {
                    res.status(404).send({ message: "Not found user with id " + id });
                } else {
                    res.send(data)
                };
            }).catch(err => {
                res.status(500).send({ message: "Error retrieving user with id=" + id });
            });
    }

    update(req, res) {
        if (!req.body) {
            return res.status(400).send({
                message: "User to update can not be empty!"
            });
        }
        const id = req.params.id;
        const cryptPassword = bcrypt.hashSync(req.body.password, 8);
        req.body.password = cryptPassword;
        User.update(req.body, {
            where: { id: id }
        }).then(([num]) => {
            if (num === 1) {
                res.send({
                    message: "User was updated successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot update User with id=${id}. Maybe Tutorial was not found or req.body is empty!`
                });
            }
        })
            .catch(err => {
                res.status(500).send({
                    message: "Error updating user with id=" + id
                });
            });
    }
    
    delete(req, res) {
        const id = req.params.id;

        User.destroy({
            where: { id: id }
        }).then(data => {
            if (!data) {
                res.status(404).send({
                    message: `Cannot delete user with id=${id}. Maybe user was not found!`
                });
            } else {
                res.send({
                    message: "User was deleted successfully!"
                });
            }
        })
            .catch(err => {
                res.status(500).send({
                    message: "Could not delete user with id=" + id
                });
            });
    }

    //API returns user information along with all addresses
    profile(req, res) {
        const id = req.params.id;
        const response = {};
        User.findByPk(id)
            .then(async data => {
                if (!data) {
                    res.status(404).send({ message: "Not found user with id " + id });
                } else {
                    response.data = data;
                    await UserAddress.findAll({ where: { userId: id } }).then(dataAddress => {
                        response.dataAddress = dataAddress;
                        if (!dataAddress) {
                            res.status(200).json(response);
                        } else {
                            res.status(200).json(response);
                        }
                    })
                };
            }).catch(err => {
                res.status(500).send({ message: "Error retrieving user with id=" + id });
            });
    }
}

export default UserController;
