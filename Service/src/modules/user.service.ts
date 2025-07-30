import { PrismaClient } from '@prisma/client';
import { CreateUserInput,userArgs } from '../dtos/args';


const prisma = new PrismaClient();

const UserService = {
  async getAllUsers() {
    try {
      const users = await prisma.users.findMany({
        where:{
          isActive : true
        },
        orderBy :{
          id : "desc"
        },
      });
     
      return users;
    } catch (error) {
      
      throw error;
    }
  },

  async createUser(user: userArgs) {
    try {
      const newUser = await prisma.users.create({
        data: user,
      });
      return newUser;
    } catch (error) {
      throw error;
    }
  },
   async updateUser(id: number, data: userArgs){
    try {
    const updatedUser = await prisma.users.update({
      where: { id },
      data: data,
    });
    return updatedUser;
  } catch (error) {
    throw error;
  }
  }
};

 



export default UserService;
