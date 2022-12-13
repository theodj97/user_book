import { TOKEN_KEY } from './config.js'
// import { sign } from "jsonwebtoken"
import jwt from "jsonwebtoken"

export const verifyToken = (req, res, next) => {
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]
    if (token == null) {
        return res.status(401).json({ message: 'token required' })
    }
    jwt.verify(token, TOKEN_KEY, (err, user) => {
        if (err) {
            return res.status(403).json({ message: 'invalid token' })
        }
        req.user = user
        next()
    })
}