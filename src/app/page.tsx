"use client"
import { Grid, Box, Button, Card } from "@mui/material";
import axios from "axios";
import Image from "next/image";
import { useEffect, useState } from "react";

function ProductCard(productInfo: { name: string, price: number, imageUrl: string }) {
    return (<Card variant="outlined" sx={{ padding: 1 }}>
        <Box sx={{ padding: 1 }}>{productInfo.name}</Box>
        <Image width={300} height={200} src={productInfo.imageUrl} alt="some photo" />
        <div>{productInfo.name}</div>
        <div>${productInfo.price}</div>
        <Box textAlign={"right"}><Button>add to cart</Button></Box>
    </Card>);
}

export default function ProductPage() {
    const [products, setProducts] = useState([] as Array<{ id: number, name: string, detail: string, price: number, image: string, stock: number }>);

    useEffect(() => {
        let cancelled = false;
        (async () => {
            try {
                const response = await axios.get("/api/product");
                if (!cancelled) setProducts(response.data);
            } catch (error) {
                console.error(error);
            }
        })();
        return () => {
            cancelled = true;
        };
    }, []);
    return (
        <>
            <Grid container columnSpacing={2} rowSpacing={2} padding={2} alignContent={"center"}>
                {products.map((product, index) => (
                    <Grid key={index} size={{ md: 6, lg: 3 }}>
                        <ProductCard imageUrl={product.image} price={product.price} name={product.name} />
                    </Grid>
                ))}
            </Grid>
        </>
    )
}