"use client"
import ProductCard from "@/components/ProductCard";
import { Grid, Button } from "@mui/material";
import axios from "axios";
import { useEffect, useState } from "react";

export default function AdminProductPage() {
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
            <Button href="./products/add">Add product</Button>
            <Grid container columnSpacing={2} rowSpacing={2} padding={2} alignContent={"center"}>
                {products.map((product, index) => (
                    <Grid key={index} size={3}>
                        <ProductCard imageUrl={product.image} price={product.price} name={product.name} />
                    </Grid>
                ))}
            </Grid>
        </>
    )
}