import express from 'express';
import { apiLimiter } from './middlewares/rateLimit.middleware';
import { errorHandler } from './middlewares/error.middleware';
import userRoutes from './modules/user.routes';

const app = express();
app.use(express.json());
app.use('/api', userRoutes);
app.use(errorHandler);

export default app;