import { Router } from 'express';
import UserAddressController from '../controllers/user-address.controller.js';

const userAddressController = new UserAddressController();

const router = Router();

router.get('', userAddressController.getAll);

router.post('', userAddressController.create);

router.get('/:id', userAddressController.findOne);

router.patch('/:id', userAddressController.update);

router.delete('/:id', userAddressController.delete);

export default router;