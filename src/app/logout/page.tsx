"use client"
import { Container } from "@mui/material";

import userCookie from "@/utils/cookie";
import { useEffect } from "react";

export default function LogoutPage() {
    useEffect(() => {
        const cookie = new userCookie();
        cookie.delete();

        window.location.href = "/";
    }, []);
    return <Container
    >Logout success</Container>
}   