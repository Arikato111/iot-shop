import { Metadata } from "next";

export const metadata: Metadata = {
    title: "Register - IoT Shop",
}

export default function LoginLayout({
    children,
}: {
    children: React.ReactNode
}) {
    return (
        <>{children}</>
    )
}