import { Router } from 'express'
import { verifyToken } from '../verifyToken.js'
import { getGenres } from '../controllers/genres.controller.js'

const router = Router()

router.get('/genres', verifyToken, getGenres)

export default router