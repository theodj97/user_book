export const images = async (req, res) => {
    try {
        res.sendFile(('/images/' + req.params.book + '.webp'), { root: '.' });
    } catch (error) {
        console.log(error)
        return res.status(404).json({
            message: 'Book not found'
        })
    }
}