const pool = require('./db'); // Импорт подключения

// Функция для сохранения одного мероприятия
async function saveEvent(event) {
    const { title, image, date, description } = event;
    const query = `
        INSERT INTO events (title, image, date, description)
        VALUES ($1, $2, $3, $4) RETURNING *;
    `;
    const values = [title, image, date, description];
    const result = await pool.query(query, values);
    return result.rows[0];
}

// Функция для сохранения массива мероприятий
async function saveEvents(events) {
    for (const event of events) {
        try {
            await saveEvent(event);
        } catch (error) {
            console.error('Ошибка при сохранении:', error);
        }
    }
}

module.exports = { saveEvent, saveEvents };