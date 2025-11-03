"use client"
import { Box, Button, Container, Grid, TextField } from "@mui/material";
import { useState } from "react";
import axios from "axios"
import userCookie from "@/utils/cookie";

export default function LoginPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");


    const submitFormEvent = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        try {
            const res = await axios.post("/api/login", {
                email,
                password
            });
            if (res.status === 200) {
                const cookie = new userCookie();
                cookie.store(res.data.token);
                window.location.href = "/";

            } else {
                setError("Login failed");
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
                            Login
                        </Box>
                        <Box style={{ color: "red" }} component={"div"}>{error}</Box>
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


