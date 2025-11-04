"use client"
import { Box, Button, Container, Grid, InputLabel, MenuItem, Select, TextField } from "@mui/material";
import { useEffect, useState } from "react";
import axios from "axios"
import userCookie from "@/utils/cookie";

export default function RegisterPage() {
    const [email, setEmail] = useState("");
    const [name, setName] = useState("")
    const [phone, setPhone] = useState("")
    const [address, setAddress] = useState("")
    const [province, setProvince] = useState(0)
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");

    const [provinceList, setProvinceList] = useState<Array<{ id: number, name: string }>>([])

    async function fetchProvinces() {
        const response = await axios.get("/api/province");
        setProvinceList(response.data);
    }
    useEffect(() => {
        (async () => {
            await fetchProvinces();
        })()
    }, [])

    const submitFormEvent = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        try {
            const res = await axios.post("/api/register", {
                email,
                password,
                phone,
                name,
                address,
                province
            });
            if (res.status === 201) {
                alert("Register successful, please login");
            } else {
                setError("Register failed");
            }
        } catch (err) {
            if (axios.isAxiosError(err))
                setError(err.response?.data.message ?? "An error occurred");
        }
    }
    return (
        <Container>
            <Grid container spacing={2}>
                <Grid size={{ lg: 3, md: 0 }}>
                </Grid>
                <Grid size={{ md: 12, lg: 6 }}>
                    <form onSubmit={submitFormEvent}>
                        <Box component="h2">
                            Register
                        </Box>
                        <Box style={{ color: "red" }} component={"div"}>{error}</Box>
                        <Box>
                            <TextField variant="standard" value={name} onChange={(e) => setName(e.target.value)} label="Name" required />
                        </Box>
                        <Box>
                            <TextField variant="standard" value={phone} onChange={(e) => setPhone(e.target.value)} label="Phone" required />
                        </Box>
                        <Box>
                            <TextField variant="standard" value={address} onChange={(e) => setAddress(e.target.value)} label="Address" required />
                        </Box>

                        <Box sx={{ padding: 3 }}>
                            <InputLabel id="province-label">Province</InputLabel>
                            <Select labelId="province-label" value={province} onChange={(e) => setProvince(e.target.value)} displayEmpty>
                                <MenuItem value={0}>Select Province</MenuItem>
                                {provinceList.map((prov) => (
                                    <MenuItem key={prov.id} value={prov.name}>{prov.name}</MenuItem>
                                ))}
                            </Select>
                        </Box>

                        <Box>
                            <TextField variant="standard" value={email} onChange={(e) => setEmail(e.target.value)} label="Email" required />
                        </Box>
                        <Box>
                            <TextField variant="standard" type="password" value={password} onChange={(e) => setPassword(e.target.value)} label="Password" required />
                        </Box>

                        <Box sx={{ padding: 2 }}>
                            <Button variant="contained" type="submit">Submit</Button>
                        </Box>
                    </form>
                </Grid>
                <Grid size={{ lg: 3, md: 0 }} > </Grid>

            </Grid>

        </Container >
    );
}


