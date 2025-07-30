import { Router } from 'express';
import { UserController } from './user.controller';
const router = Router();

//routes for controllers
router.get('/', UserController.getUsers);
router.post('/user/create', UserController.createUser);
router.patch('/user/:id', UserController.updateUser);

export default router;