import { Router } from 'express';
import userRoute from './user.route.js';
import authRoute from './auth.route.js';
import userAddress from './user-address.route.js';

const router = Router();

router.use('/user', userRoute);

router.use('/auth', authRoute);

router.use('/user-address', userAddress);

export default router; 