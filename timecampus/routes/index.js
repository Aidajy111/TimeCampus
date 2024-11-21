const Router = require('express')
const router = new Router()
const eventRouter = require('./eventRouter')

router.use('/event', eventRouter)

module.exports = router