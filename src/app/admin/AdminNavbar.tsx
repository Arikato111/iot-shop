"use client"
import { Box, Button } from "@mui/material"

export default function AdminNavbar() {
    return (
        <Box sx={{padding: 1}}>
            <Button variant="contained" href="/admin/dashboard">Dashboard</Button>
            <Button href="/admin/products">Products</Button>
            <Button href="/admin/province">Province</Button>
            <Button href="/admin/users">Users</Button>
        </Box>
    )
}