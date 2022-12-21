import { pool } from "../db.js"

export const getGenres = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM books_genre;')
        if (rows <= 0) {
            return res.status(404).json({ message: 'No genres found' })
        }
        res.json(rows)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}