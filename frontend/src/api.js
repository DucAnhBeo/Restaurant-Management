import axios from "axios";

const API_URL = "http://localhost:5000/api";

// Lấy dữ liệu
export const fetchNSX = () => axios.get(`${API_URL}/nsx`);
export const fetchSP = () => axios.get(`${API_URL}/sp`);
export const fetchPC = () => axios.get(`${API_URL}/pc`);
export const fetchLaptop = () => axios.get(`${API_URL}/laptop`);

// Thêm dữ liệu
export const addNSX = (data) => axios.post(`${API_URL}/nsx`, data);
export const addSP = (data) => axios.post(`${API_URL}/sp`, data);
export const addPC = (data) => axios.post(`${API_URL}/pc`, data);
export const addLaptop = (data) => axios.post(`${API_URL}/laptop`, data);

// Sửa dữ liệu
export const updateNSX = (maNSX, data) => axios.put(`${API_URL}/nsx/${maNSX}`, data);
export const updateSP = (maSP, data) => axios.put(`${API_URL}/sp/${maSP}`, data);
export const updatePC = (maSP_P, data) => axios.put(`${API_URL}/pc/${maSP_P}`, data);
export const updateLaptop = (maSP_L, data) => axios.put(`${API_URL}/laptop/${maSP_L}`, data);

// Xoá dữ liệu
export const deleteNSX = (maNSX) => axios.delete(`${API_URL}/nsx/${maNSX}`);
export const deleteSP = (maSP) => axios.delete(`${API_URL}/sp/${maSP}`);
export const deletePC = (maSP_P) => axios.delete(`${API_URL}/pc/${maSP_P}`);
export const deleteLaptop = (maSP_L) => axios.delete(`${API_URL}/laptop/${maSP_L}`);
