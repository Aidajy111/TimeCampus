const express = require("express");
const router = require("./routes/index");

const app = express();
const PORT = 3000;

app.use(express.json());


app.get('/', (req, res) => {
    res.send('Ok');
});
app.use('/api', router)

// Запуск сервера
app.listen(PORT, () => {
    console.log(`Сервер запущен на http://localhost:${PORT}`);
});