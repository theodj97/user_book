import { Router } from 'express'
import { verifyToken } from '../verifyToken.js'
import { getUBooks } from '../controllers/user_books.controller.js'

const router = Router()

router.get('/uBooks', verifyToken, getUBooks)

export default router