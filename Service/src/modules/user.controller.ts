import { Request, Response } from 'express';
import  UserService from './user.service';
import {UserField} from '../dtos/args';


export const UserController={
 async getUsers(req: Request, res: Response) {
  try {
    const users = await UserService.getAllUsers(); 
    res.json(users);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
},

 async createUser(req: Request, res: Response) {
try   {
    const data = UserField.parse(req.body);
    const user = await UserService.createUser(data);
    res.status(201).json(user);
  } catch (error: any) {
    res.status(400).json({ error: error.message });
  }
},

 async updateUser(req:Request, res:Response){
 const id = parseInt(req.params.id);
  const data = req.body;

  try {
    const updated = await UserService.updateUser(id, data);
    res.json(updated);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }

}
}
