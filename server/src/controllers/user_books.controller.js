import { pool } from "../db.js"

export const getUBooks = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT books.* FROM books JOIN user_book ON books.id = user_book.book WHERE user_book.user = ? ;', [req.user.userId])
        console.log(req.user.userId)

        if (rows <= 0) {
            return res.status(404).json({ message: 'No books for this user' })
        }

        res.json(rows)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}