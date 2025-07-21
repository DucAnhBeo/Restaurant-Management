require("dotenv").config();
const express = require("express");
const sql = require("mssql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

// Cấu hình SQL Server
const dbConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    database: process.env.DB_DATABASE,
    options: {
        encrypt: false,
        enableArithAbort: true,
    },
};

// Kết nối SQL Server
sql.connect(dbConfig)
    .then(() => console.log("Connected to SQL Server"))
    .catch((err) => console.log(err));

// API lấy dữ liệu
app.get("/api/nsx", async (req, res) => {
    try {
        const result = await sql.query("SELECT * FROM NSX");
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get("/api/sp", async (req, res) => {
    try {
        const result = await sql.query("SELECT * FROM SP");
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get("/api/pc", async (req, res) => {
    try {
        const result = await sql.query("SELECT * FROM PC");
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get("/api/laptop", async (req, res) => {
    try {
        const result = await sql.query("SELECT * FROM Laptop");
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Thêm dữ liệu vào NSX
app.post("/api/nsx", async (req, res) => {
    const { MaNSX, TenNSX, DiaChi } = req.body;
    try {
        const result = await sql.query`
            INSERT INTO NSX (MaNSX, TenNSX, DiaChi)
            VALUES (${MaNSX}, ${TenNSX}, ${DiaChi})
        `;
        res.status(201).json({ message: "Thêm Nhà Sản Xuất thành công!", data: { MaNSX, TenNSX, DiaChi }  });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Sửa dữ liệu trong bảng NSX
app.put("/api/nsx/:maNSX", async (req, res) => {
    const { maNSX } = req.params;
    const { TenNSX, DiaChi } = req.body;
    try {
        const result = await sql.query`
            UPDATE NSX 
            SET TenNSX = ${TenNSX}, DiaChi = ${DiaChi} 
            WHERE MaNSX = ${maNSX}
        `;
        res.json({ message: "Cập nhật Nhà Sản Xuất thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Xoá dữ liệu trong bảng NSX
app.delete("/api/nsx/:maNSX", async (req, res) => {
    const { maNSX } = req.params;
    try {
        const result = await sql.query`
            DELETE FROM NSX 
            WHERE MaNSX = ${maNSX}
        `;
        res.json({ message: "Xoá Nhà Sản Xuất thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Thêm dữ liệu vào SP
app.post("/api/sp", async (req, res) => {
    const { MaNSX, MaSP, Loai } = req.body;
    try {
        const result = await sql.query`
            INSERT INTO SP (MaNSX, MaSP, Loai)
            VALUES (${MaNSX}, ${MaSP}, ${Loai})
        `;
        res.status(201).json({ message: "Thêm Sản Phẩm thành công!", data: { MaNSX, MaSP, Loai }  });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Sửa dữ liệu trong bảng SP
app.put("/api/sp/:maSP", async (req, res) => {
    const { maSP } = req.params;
    const { MaNSX, Loai } = req.body;
    try {
        const result = await sql.query`
            UPDATE SP 
            SET MaNSX = ${MaNSX}, Loai = ${Loai} 
            WHERE MaSP = ${maSP}
        `;
        res.json({ message: "Cập nhật Sản Phẩm thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Xoá dữ liệu trong bảng SP
app.delete("/api/sp/:maSP", async (req, res) => {
    const { maSP } = req.params;
    try {
        const result = await sql.query`
            DELETE FROM SP 
            WHERE MaSP = ${maSP}
        `;
        res.json({ message: "Xoá Sản Phẩm thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Thêm dữ liệu vào PC
app.post("/api/pc", async (req, res) => {
    const { MaSP_P, CPU, RAM, HD, Gia } = req.body;
    try {
        const result = await sql.query`
            INSERT INTO PC (MaSP_P, CPU, RAM, HD, Gia)
            VALUES (${MaSP_P}, ${CPU}, ${RAM}, ${HD}, ${Gia})
        `;
        res.status(201).json({ message: "Thêm PC thành công!", data: { MaSP_P, CPU, RAM, HD, Gia  }});
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Sửa dữ liệu trong bảng PC
app.put("/api/pc/:maSP_P", async (req, res) => {
    const { maSP_P } = req.params;
    const { CPU, RAM, HD, Gia } = req.body;
    try {
        const result = await sql.query`
            UPDATE PC 
            SET CPU = ${CPU}, RAM = ${RAM}, HD = ${HD}, Gia = ${Gia}
            WHERE MaSP_P = ${maSP_P}
        `;
        res.json({ message: "Cập nhật PC thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Xoá dữ liệu trong bảng PC
app.delete("/api/pc/:maSP_P", async (req, res) => {
    const { maSP_P } = req.params;
    try {
        const result = await sql.query`
            DELETE FROM PC 
            WHERE MaSP_P = ${maSP_P}
        `;
        res.json({ message: "Xoá PC thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Thêm dữ liệu vào Laptop
app.post("/api/laptop", async (req, res) => {
    const { MaSP_L, CPU, RAM, HD, ManHinh, Gia } = req.body;
    try {
        const result = await sql.query`
            INSERT INTO Laptop (MaSP_L, CPU, RAM, HD, ManHinh, Gia)
            VALUES (${MaSP_L}, ${CPU}, ${RAM}, ${HD}, ${ManHinh}, ${Gia})
        `;
        res.status(201).json({ message: "Thêm Laptop thành công!",data: { MaSP_L, CPU, RAM, HD, ManHinh, Gia  } });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Sửa dữ liệu trong bảng Laptop
app.put("/api/laptop/:maSP_L", async (req, res) => {
    const { maSP_L } = req.params;
    const { CPU, RAM, HD, ManHinh, Gia } = req.body;
    try {
        const result = await sql.query`
            UPDATE Laptop 
            SET CPU = ${CPU}, RAM = ${RAM}, HD = ${HD}, ManHinh = ${ManHinh}, Gia = ${Gia}
            WHERE MaSP_L = ${maSP_L}
        `;
        res.json({ message: "Cập nhật Laptop thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Xoá dữ liệu trong bảng Laptop
app.delete("/api/laptop/:maSP_L", async (req, res) => {
    const { maSP_L } = req.params;
    try {
        const result = await sql.query`
            DELETE FROM Laptop 
            WHERE MaSP_L = ${maSP_L}
        `;
        res.json({ message: "Xoá Laptop thành công!" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


// Khởi động server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
