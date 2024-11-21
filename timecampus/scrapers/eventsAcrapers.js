const axios = require('axios');
const cheerio = require('cheerio');

const URL = 'https://gorodzovet.ru/ulan-ude/';

async function scrapeEvents() {
    try {
        // Загружаем страницу
        const { data } = await axios.get(URL);

        // Загружаем HTML в Cheerio
        const $ = cheerio.load(data);

        // Массив для хранения данных
        const events = [];

        // Парсим данные (проверьте селекторы на сайте)
        $('.event-block').each((i, el) => { 
            const title = $(el).find('h3.lines span').text().trim(); // Название
            const image = $(el).find('picture img').attr('src'); // картинка
            const date = $(el).find('.event-date').text().trim();  // Дата
            const desc = $(el).find('.lines.lines4').text().trim(); // Место

            events.push({ title, image, date, desc });
        });

        console.log('Спарсенные мероприятия:', events);
        return events;
    } catch (error) {
        console.error('Ошибка парсинга:', error);
        return [];
    }
    
}

module.exports = { scrapeEvents };