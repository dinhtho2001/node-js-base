import { Router } from 'express';
import UserController from '../controllers/user.controller.js';

const userController = new UserController();
const router = Router();

router.get('', userController.getAll);

router.post('', userController.create);

router.get('/:id', userController.findOne);

router.patch('/:id', userController.update);

router.delete('/:id', userController.delete);

export default router;