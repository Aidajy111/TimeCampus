const { scrapeEvents } = require('../scrapers/eventsAcrapers');
const { saveEvents } = require('../db/events');

class EventControllers {
async getAll(req, res) {
    try {
        const events = await scrapeEvents();
        if (events.length > 0) {
            console.log('Сохраняем мероприятия в БД...');
            await saveEvents(events);
            res.json({ message: 'Мероприятия успешно сохранены!', events });
        } else {
            res.status(404).json({ message: 'Нет данных для сохранения.' });
        }
    } catch (error) {
        console.error('Ошибка при обработке:', error);
        res.status(500).json({ message: 'Произошла ошибка.', error });
    }
}

    async getOne(req, res) {
        res.send('Ok');
    }
}

module.exports = new EventControllers();