"use client"
import { Button, Box, Container, TextField, InputLabel, Select, MenuItem } from "@mui/material";
import axios from "axios";
import { useEffect, useState } from "react";

export default function AddProduct() {
    const [name, setName] = useState("")
    const [detail, setDetail] = useState("")
    const [price, setPrice] = useState(0)
    const [image, setImage] = useState("")
    const [stock, setStock] = useState(0)
    const [province, setProvince] = useState("")
    const [error, setError] = useState("")

    const [provinceList, setProvinceList] = useState([] as Array<{ id: number, name: string }>)

    useEffect(() => {
        (async function () {
            const response = await axios.get("/api/province");
            setProvinceList(response.data);

        })()
    }, [])

    async function submitFormEvent(event: React.FormEvent<HTMLFormElement>) {
        event.preventDefault();

        console.log(province);
        try {


            const response = await axios.post("/api/product", { name, detail, price, image, stock, province });
            if (response.status === 201) {
                alert("Product added successfully");
                setTimeout(() => {
                    window.location.href = "/admin/products";
                }, 1000);
            } else {
                setError("Failed to add product");
            }
        } catch (err) {
            if (axios.isAxiosError(err))
                setError(err.response?.data.message ?? "An error occurred");
        }
    }
    return <Container>
        <form onSubmit={submitFormEvent}>
            <Box>
                <h3>Add new product</h3>
            </Box>
            <Box style={{ color: "red" }} component={"div"}>{error}</Box>
            <Box>
                <TextField variant="standard" value={name} onChange={(e) => setName(e.target.value)} label="Name" required />
            </Box>
            <Box>
                <TextField variant="standard" value={detail} onChange={(e) => setDetail(e.target.value)} label="Detail" required />
            </Box>
            <Box>
                <TextField variant="standard" value={price} onChange={(e) => setPrice(Number(e.target.value))} label="Price" required />
            </Box>
            <Box>
                <TextField variant="standard" value={stock} onChange={(e) => setStock(Number(e.target.value))} label="Stock" required />
            </Box>
            <Box>
                <TextField variant="standard" value={image} onChange={(e) => setImage(e.target.value)} label="image url" required />
            </Box>
            <Box sx={{ padding: 3 }}>
                <InputLabel id="province-label">Place of sale</InputLabel>
                <Select labelId="province-label" value={province} onChange={(e) => setProvince(e.target.value)} displayEmpty>
                    <MenuItem value={0} selected>Select Province</MenuItem>
                    {provinceList.map((prov) => (
                        <MenuItem key={prov.id} value={prov.name}>{prov.name}</MenuItem>
                    ))}
                </Select>
            </Box>



            <Box sx={{ p: 3 }}>
                <Button type="submit" variant="contained">Submit</Button>
            </Box>




        </form>
    </Container>
}