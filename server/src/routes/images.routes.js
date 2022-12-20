import { Router } from 'express'
import { images } from '../controllers/images.controller.js';

const router = Router()

router.get('/images/books/:book', images);

export default router