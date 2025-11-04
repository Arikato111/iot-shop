import { Grid } from "@mui/material";
import { Metadata } from "next";

export const metadata: Metadata = {
    title: "add product"
}

export default function AdminAddProductLayout({
    children,
}: {
    children: React.ReactNode
}) {
    return (
        <Grid container columnSpacing={2} rowSpacing={2} padding={2} alignContent={"center"}>
            <Grid size={{ md: 4, sm: 0 }}></Grid>
            <Grid size={{ md: 6, sm: 12 }}>
                {children}
            </Grid>
            <Grid size={{ md: 4, sm: 0 }}></Grid>
        </Grid>
    )
}