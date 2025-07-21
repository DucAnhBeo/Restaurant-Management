import React, { useEffect, useState } from "react";
import DataTable from "./components/DataTable";
import {
    fetchNSX, addNSX, updateNSX, deleteNSX,
    fetchSP, addSP, updateSP, deleteSP,
    fetchPC, addPC, updatePC, deletePC,
    fetchLaptop, addLaptop, updateLaptop, deleteLaptop
} from "./api";
import { Container, Typography, Box } from "@mui/material";

const App = () => {
    const [nsx, setNsx] = useState([]);
    const [sp, setSp] = useState([]);
    const [pc, setPc] = useState([]);
    const [laptop, setLaptop] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        loadAllData();
    }, []);

    const loadAllData = async () => {
        try {
            setLoading(true);
            const [nsxRes, spRes, pcRes, laptopRes] = await Promise.all([
                fetchNSX(),
                fetchSP(),
                fetchPC(),
                fetchLaptop()
            ]);

            setNsx(nsxRes.data);
            setSp(spRes.data);
            setPc(pcRes.data);
            setLaptop(laptopRes.data);
            setError(null);
        } catch (error) {
            console.error("Error loading data:", error);
            setError("Không thể tải dữ liệu. Vui lòng thử lại sau.");
        } finally {
            setLoading(false);
        }
    };

    const handleAdd = async (addFunc, newItem) => {
        try {
            await addFunc(newItem);
            await loadAllData();
            return true;
        } catch (error) {
            console.error("Error adding data:", error);
            setError("Lỗi khi thêm dữ liệu");
            return false;
        }
    };

    const handleEdit = async (updateFunc, updatedItem, idField) => {
        try {
            await updateFunc(updatedItem[idField], updatedItem);
            await loadAllData();
            return true;
        } catch (error) {
            console.error("Error updating data:", error);
            setError("Lỗi khi cập nhật dữ liệu");
            return false;
        }
    };

    const handleDelete = async (deleteFunc, item, idField) => {
        if (!window.confirm("Bạn có chắc chắn muốn xóa?")) return false;

        try {
            await deleteFunc(item[idField]);
            await loadAllData();
            return true;
        } catch (error) {
            console.error("Error deleting data:", error);
            setError("Lỗi khi xóa dữ liệu");
            return false;
        }
    };

    if (loading) {
        return (
            <Container>
                <Typography variant="h6">Đang tải dữ liệu...</Typography>
            </Container>
        );
    }

    if (error) {
        return (
            <Container>
                <Typography color="error">{error}</Typography>
                <button onClick={loadAllData}>Thử lại</button>
            </Container>
        );
    }

    return (
        <Container maxWidth="lg">
            <Box my={4}>
                <Typography variant="h4" gutterBottom>
                    Hệ thống quản lý phần cứng máy tính
                </Typography>

                <Box my={4}>
                    <Typography variant="h5" gutterBottom>
                        Quản lý Nhà Sản Xuất
                    </Typography>
                    <DataTable
                        data={nsx}
                        columns={["MaNSX", "TenNSX", "DiaChi"]}
                        onAdd={(item) => handleAdd(addNSX, item)}
                        onEdit={(item) => handleEdit(updateNSX, item, "MaNSX")}
                        onDelete={(item) => handleDelete(deleteNSX, item, "MaNSX")}
                    />
                </Box>

                <Box my={4}>
                    <Typography variant="h5" gutterBottom>
                        Quản lý Sản Phẩm
                    </Typography>
                    <DataTable
                        data={sp}
                        columns={["MaNSX", "MaSP", "Loai"]}
                        onAdd={(item) => handleAdd(addSP, item)}
                        onEdit={(item) => handleEdit(updateSP, item, "MaSP")}
                        onDelete={(item) => handleDelete(deleteSP, item, "MaSP")}
                    />
                </Box>

                <Box my={4}>
                    <Typography variant="h5" gutterBottom>
                        Quản lý PC
                    </Typography>
                    <DataTable
                        data={pc}
                        columns={["MaSP_P", "CPU", "RAM", "HD", "Gia"]}
                        onAdd={(item) => handleAdd(addPC, item)}
                        onEdit={(item) => handleEdit(updatePC, item, "MaSP_P")}
                        onDelete={(item) => handleDelete(deletePC, item, "MaSP_P")}
                    />
                </Box>

                <Box my={4}>
                    <Typography variant="h5" gutterBottom>
                        Quản lý Laptop
                    </Typography>
                    <DataTable
                        data={laptop}
                        columns={["MaSP_L", "CPU", "RAM", "HD", "ManHinh", "Gia"]}
                        onAdd={(item) => handleAdd(addLaptop, item)}
                        onEdit={(item) => handleEdit(updateLaptop, item, "MaSP_L")}
                        onDelete={(item) => handleDelete(deleteLaptop, item, "MaSP_L")}
                    />
                </Box>
            </Box>
        </Container>
    );
};

export default App;