const Router = require('express')
const router = new Router()
const eventControllers = require('../controllers/eventControllers')


router.get('/', eventControllers.getAll)
router.get('/:id', eventControllers.getOne)

module.exports = router