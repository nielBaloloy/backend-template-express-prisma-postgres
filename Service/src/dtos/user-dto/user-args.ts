// user.schema.ts
import { z } from 'zod';

export const UserField = z.object({
  firstName: z.string().min(1, "First name is required"),
  middleName: z.string().optional(),
  lastName: z.string().min(1, "Last name is required"),
  suffixName: z.string().optional(),
  age: z.number().int().nonnegative().optional(),
  isActive : z.boolean().optional(),
  created_at: z.preprocess((val) => {
    if (typeof val === 'string' || val instanceof Date) return new Date(val);
  }, z.date().optional()),
});

export type userArgs = z.infer<typeof UserField>;
