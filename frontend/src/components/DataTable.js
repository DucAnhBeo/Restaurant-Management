import React, { useState } from "react";

const DataTable = ({ data, columns, onAdd, onEdit, onDelete }) => {
    const [newItem, setNewItem] = useState({});
    const [editItem, setEditItem] = useState(null);
    const [error, setError] = useState(null);

    const handleChange = (e, col) => {
        setNewItem({ ...newItem, [col]: e.target.value });
    };

    const handleEditChange = (e, col) => {
        setEditItem({ ...editItem, [col]: e.target.value });
    };

    const handleAdd = async () => {
        // Kiểm tra dữ liệu đầu vào
        for (const col of columns) {
            if (!newItem[col]) {
                setError(`Vui lòng điền đầy đủ thông tin (thiếu ${col})`);
                return;
            }
        }

        const success = await onAdd(newItem);
        if (success) {
            setNewItem({}); // Reset form sau khi thêm thành công
            setError(null);
        } else {
            setError("Thêm dữ liệu thất bại. Vui lòng thử lại.");
        }
    };

    return (
        <div>
            <table border="1" cellPadding="5" cellSpacing="0">
                <thead>
                <tr>
                    {columns.map((col) => (
                        <th key={col}>{col}</th>
                    ))}
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                {data.map((item, index) => (
                    <tr key={index}>
                        {columns.map((col) => (
                            <td key={col}>
                                {editItem && editItem[columns[0]] === item[columns[0]] ? (
                                    <input
                                        type="text"
                                        value={editItem[col]}
                                        onChange={(e) => handleEditChange(e, col)}
                                    />
                                ) : (
                                    item[col]
                                )}
                            </td>
                        ))}
                        <td>
                            {editItem && editItem[columns[0]] === item[columns[0]] ? (
                                <button onClick={() => onEdit(editItem)}>Lưu</button>
                            ) : (
                                <>
                                    <button onClick={() => setEditItem(item)}>Sửa</button>
                                    <button onClick={() => onDelete(item)}>Xóa</button>
                                </>
                            )}
                        </td>
                    </tr>
                ))}
                <tr>
                    {columns.map((col) => (
                        <td key={col}>
                            <input
                                type="text"
                                value={newItem[col] || ""}
                                onChange={(e) => handleChange(e, col)}
                            />
                        </td>
                    ))}
                    <td>
                        <button onClick={handleAdd}>Thêm</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    );
};

export default DataTable;
