import { Router } from 'express'
import { getUsers, getUser, addUsers, deleteUsers, updateUsersFull, updateUsers } from '../controllers/user.controller.js'
import { verifyToken } from '../verifyToken.js'

const router = Router()

router.get('/users', verifyToken, getUsers)
router.get('/users/:id', getUser)
router.post('/users', addUsers)
router.delete('/users/:id', deleteUsers)
router.put('/users/:id', updateUsersFull)
router.patch('/users/:id', updateUsers)


export default router