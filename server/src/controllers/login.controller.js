import { pool } from '../db.js'
import jwt from "jsonwebtoken"
import { TOKEN_KEY } from '../config.js'

export const login = async (req, res) => {
    try {
        const email = req.body.email
        const passwd = req.body.passwd
        console.log('new call' + email + ' ' + passwd)

        const [rows] = await pool.query('SELECT * FROM users WHERE email = ? AND passwd = ?', [email, passwd])
        if (rows <= 0) {
            setTimeout(() => {
                return res.status(404).json({ message: 'Incorrect login attempt' })
            }, 3000)
        } else {
            const token = jwt.sign(
                {
                    userId: rows[0].id,
                    userEmail: rows[0].userEmail
                },
                // Token key es una contraseña que utiliza nuestro servidor para que sea más complicado generar JWT por cualquier persona y con ellos acceder a nuestro servidor
                TOKEN_KEY,
                { expiresIn: '1h' }
            )
            setTimeout(() => {
                return res.status(200).json(token)
            }, 3000)
            // return res.status(200).json(token)
        }
    } catch (error) {
        console.log(error)
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}