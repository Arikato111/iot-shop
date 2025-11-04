"use client"
import { Button, Card, Container, TextField } from "@mui/material";
import axios from "axios";
import { useEffect, useState } from "react";

export default function ProvincePage() {
    const [provinceList, setProvinceList] = useState([] as Array<{ id: number, name: string }>);
    async function fetchProvinces() {
        const res = await axios.get("/api/province");
        setProvinceList(res.data);
    }
    async function removeProvince(id: number) {
        if (confirm("Are you sure to delete this province?")) {
            await axios.delete(`/api/province/${id}`);
            await fetchProvinces();
        }
    }
    useEffect(() => {
        (async () => {
            await fetchProvinces();
        })();
    }, [])
    return <Container>
        <h1 style={{ textAlign: "center" }}>Province Management</h1>
        <AddProvinceForm fetchProvince={fetchProvinces} />
        {provinceList.map((province) => (
            <Card sx={{ padding: 1 }} key={province.id}>
                {province.id}. {province.name}
                <Button sx={{ float: "right" }} variant="contained" color="error" onClick={() => removeProvince(province.id)}>Delete</Button>
            </Card>
        ))}


    </Container>
}

function AddProvinceForm(params: { fetchProvince: () => void }) {
    const [provinceName, setProvinceName] = useState("");
    async function handleSubmit(event: React.FormEvent) {
        event.preventDefault();
        await axios.post("/api/province", { name: provinceName });
        setProvinceName("");
        params.fetchProvince()
    }
    return <form onSubmit={handleSubmit}>
        <TextField type="text" value={provinceName} onChange={(e) => setProvinceName(e.target.value)} label="Province Name" variant="outlined" required sx={{ marginRight: 1 }} />
        <Button type="submit" variant="contained">Add Province</Button>
    </form>
}