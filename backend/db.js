require("dotenv").config();
const sql = require("mssql");

const config = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    database: process.env.DB_DATABASE,
    port: parseInt(process.env.DB_PORT),
    options: {
        encrypt: false, // Đặt true nếu dùng Azure
        trustServerCertificate: true,
    },
};

async function connectDB() {
    try {
        await sql.connect(config);
        console.log("✅ Kết nối SQL Server thành công!");
    } catch (error) {
        console.error("❌ Lỗi kết nối SQL Server:", error);
    }
}

module.exports = { sql, connectDB };
