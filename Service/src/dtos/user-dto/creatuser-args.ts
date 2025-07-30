// user.schema.ts
import { z } from 'zod';

export const createUserSchema = z.object({
  firstName: z.string().min(1, "First name is required"),
  middleName: z.string().optional(),
  lastName: z.string().min(1, "Last name is required"),
  suffixName: z.string().optional(),
  age: z.number().int().nonnegative().optional(),
  
});

export type CreateUserInput = z.infer<typeof createUserSchema>;
