import express from 'express';
import userRoutes from './modules/user.routes';
import { errorHandler } from './middlewares/error.middleware';
const app = express();
app.use(express.json());
app.use('/api', userRoutes); 

const PORT = process.env.PORT || 5002;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
