import express from 'express'
import cors from 'cors'
import { ANGULAR_CLIENT } from './config.js'


// IMPORTANTE cuando importo mis propios módulos, es importarte poner el .js, si es un módulo de terceros no es necesario
// import userRoutes from './routes/users.routes.js'
import loginRoutes from './routes/login.routes.js'
import uBookRoutes from './routes/user_books.routes.js'
import userRoutes from './routes/users.routes.js'

const app = express()
// Este método se utiliza para recibir los bodys de las consultas
app.use(express.json())
// Este método se utiliza para que no se bloqueen las llamadas por cors
app.use(cors({ credentials: true, origin: ANGULAR_CLIENT }))

// app.use('/api', userRoutes)
app.use('/api', loginRoutes)
app.use('/api', uBookRoutes)

// Aquí se define una función que indica que la URL introducida por el cliente NO existe
app.use((req, res, next) => {
    res.status(400).json({
        message: 'no endpoint for this URL'
    })
})

export default app