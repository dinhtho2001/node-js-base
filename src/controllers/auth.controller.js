import bcrypt from "bcryptjs";
import User from "../models/user.model.js"

class AuthController {
   async login(req, res) {
      if (!req.body) {
         return res.status(400).send({
            message: "UserName or Password can not be empty!"
        });
      }
      try {
         let user = await User.findOne({ where: { username: req.body.username } });       
         if (user) {         
            let password_valid = await bcrypt.compareSync(req.body.password, user.password);
            if (password_valid) {
               return res.status(200).json({ data: user });
            }
            return res.status(400).send({ message: "Wrong password" });
         }
         else {
            return res.status(400).send({ message: "Wrong username" });
         }
      } catch (error) {
         res.status(500).send({
            message: "Error login", error: error
        });
      }
   }

   async register(req, res) {
      if (!req.body) {
         return res.status(400).send({
            message: "UserName or Password can not be empty!"
        });
      }
      try {
         let userOld = await User.findOne({ where: { username: req.body.username } });
         let salt = await bcrypt.genSaltSync(10);
         if (userOld !== null) {
            return res.status(400).send({ message: "Account already exists" });
         } else {
            var user = {
               username: req.body.username,
               password: await bcrypt.hashSync(req.body.password, salt),
               firstName: req.body.firstName,
               lastName: req.body.lastName,
               email: req.body.email,
               telephone: req.body.telephone,
            };
            const created_user = await User.create(user);
            return res.status(201).json(created_user);
         }
      } catch (error) {
         res.status(500).send({
            message: "Error register", error: error
        });
      }
     
   }
}

export default AuthController;
