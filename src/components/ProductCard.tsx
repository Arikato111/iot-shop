import { Card } from "@mui/material";
import Image from "next/image";

export default function ProductCard(productInfo: { name: string, price: number, imageUrl: string }) {
    return (<Card variant="outlined" sx={{padding: 1}}>
        <div>{productInfo.name}</div>
        <Image width={300} height={200} src={productInfo.imageUrl} alt="some photo" />
        <div>{productInfo.name}</div>
        <div>${productInfo.price}</div>
    </Card>);
}