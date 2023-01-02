import { pool } from "../db.js"

export const getUBooks = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT books.*, books_genre.genre AS genre_name, user_book.purchased, user_book.readed, user_book.page_index FROM books JOIN user_book ON books.id = user_book.book JOIN books_genre ON books.genre = books_genre.id WHERE user_book.user = ? ;', [req.user.userId])
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