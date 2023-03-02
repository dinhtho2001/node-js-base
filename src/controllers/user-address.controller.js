import UserAddress from "../models/user-address.model.js"
import User from "../models/user.model.js"

class UserAddressController {
    async getAll(req, res) {
        await UserAddress.findAll()
            .then(posts => res.status(200).json(posts))
            .catch(err => res.status(400).json({ err }));
    }
    create(req, res) {
        // check User is already exist
        if (!(User.findByPk(req.body.userId).data)) {
            return res.status(400).send({
                message: "User does not exist"
            });
        }
        UserAddress.create(req.body)
            .then(result => res.status(200).json(result))
            .catch(err => res.status(401).send(err.message));
    }
    findOne(req, res) {
        const id = req.params.id;
        UserAddress.findByPk(id)
            .then(data => {
                if (!data) {
                    res.status(404).send({ message: "Not found UserAddressAddress with id " + id });
                } else {
                    res.send(data)
                };
            }).catch(err => {
                res.status(500).send({ message: "Error retrieving UserAddressAddress with id=" + id });
            });
    }
    update(req, res) {
        if (!req.body) {
            return res.status(400).send({
                message: "UserAddress to update can not be empty!"
            });
        }
        const id = req.params.id;
        const cryptPassword = bcrypt.hashSync(req.body.password, 8);
        req.body.password = cryptPassword;
        UserAddress.update(req.body, {
            where: { id: id }
        }).then(([num]) => {
                if (num === 1) {
                    res.send({
                        message: "UserAddress was updated successfully."
                    });
                } else {
                    res.status(404).send({
                        message: `Cannot update UserAddress with id=${id}. Maybe Tutorial was not found or req.body is empty!`
                    });
                }
            })
            .catch(err => {
                res.status(500).send({
                    message: "Error updating UserAddress with id=" + id
                });
            });
    }
    delete(req, res) {
        const id = req.params.id;

        UserAddress.destroy({
            where: { id: id }
        }).then(data => {
            if (!data) {
                res.status(404).send({
                    message: `Cannot delete UserAddress with id=${id}. Maybe UserAddress was not found!`
                });
            } else {
                res.send({
                    message: "UserAddress was deleted successfully!"
                });
            }
        })
            .catch(err => {
                res.status(500).send({
                    message: "Could not delete UserAddress with id=" + id
                });
            });
    }
    
 }
 
 export default UserAddressController;