import { pool } from "../db.js"

export const getUsers = async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM users')
        res.json(rows)
        // Con esta función de abajo es posible saber el ID del usuario
        // console.log(req.user)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}
export const getUser = async (req, res) => {
    try {
        if (req.params.id == null) {
            return res.status(404).json({ message: 'No user ID received' })
        }
        const [rows] = await pool.query('SELECT * FROM users WHERE id = ?', [req.params.id])
        if (rows <= 0) {
            return res.status(404).json({ message: 'User not found' })
        }
        res.json(rows)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}
export const addUsers = async (req, res) => {
    try {
        const { username, useremail, userpasswd } = req.body
        const [rows] = await pool.query('INSERT INTO users (username, useremail, userpasswd) VALUES (?, ?, ?)', [username, useremail, userpasswd])
        res.send({
            id: rows.insertId,
            username,
            useremail,
            userpasswd,
        })
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}
export const deleteUsers = async (req, res) => {
    try {
        if (req.params.id == null) {
            return res.status(404).json({ message: 'No user ID received' })
        }
        const [result] = await pool.query('DELETE FROM users WHERE id = ?', [req.params.id])
        if (result.affectedRows <= 0) {
            return res.status(404).json({ message: 'User not found' })
        }
        // res.json({ message: 'User ' + req.params.id + ' deleted', })
        res.sendStatus(204)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}

export const updateUsersFull = async (req, res) => {
    try {
        if (req.params.id == null && req.body == null) {
            return res.status(404).json({ message: 'No user received' })
        }
        const { id } = req.params;
        const { username, useremail, userpasswd } = req.body

        const [result] = await pool.query('UPDATE users SET username = ?, useremail = ?, userpasswd = ? WHERE id = ?', [username, useremail, userpasswd, id])

        if (result.affectedRows === 0) {
            return res.status(404).json({
                message: 'User not found'
            })
        }

        const [rows] = await pool.query('SELECT * FROM users WHERE id = ?', [id])
        res.json(rows)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}

export const updateUsers = async (req, res) => {
    try {
        if (req.params.id == null && req.body == null) {
            return res.status(404).json({ message: 'No user received' })
        }
        const { id } = req.params;
        const { username, useremail, userpasswd } = req.body

        const [result] = await pool.query('UPDATE users SET username = IFNULL(?, username), useremail = IFNULL(?, useremail), userpasswd = IFNULL(?, userpasswd) WHERE id = ?', [username, useremail, userpasswd, id])

        if (result.affectedRows === 0) {
            return res.status(404).json({
                message: 'User not found'
            })
        }

        const [rows] = await pool.query('SELECT * FROM users WHERE id = ?', [id])
        res.json(rows)
    } catch (error) {
        return res.status(500).json({
            message: 'Something went wrong'
        })
    }
}