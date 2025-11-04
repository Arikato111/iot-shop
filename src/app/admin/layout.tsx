import { Metadata } from "next";
import AdminNavbar from "./AdminNavbar";

export const metadata: Metadata = {
    title: "Admin - IoT Shop",
}

export default function LoginLayout({
    children,
}: {
    children: React.ReactNode
}) {
    return (
        <>
        <AdminNavbar />
        {children}</>
    )
}