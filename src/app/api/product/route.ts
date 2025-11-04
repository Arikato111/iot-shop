import db from "@/models/prismaClient";

export async function GET() {
  const products = await db.product.findMany();
  return new Response(JSON.stringify(products), {
    status: 200,
    headers: {
      "Content-Type": "application/json",
    },
  });
}

export async function POST(request: Request) {
  const { name, detail, price, province, image, stock } = await request.json();
  const verifyProvince = await db.province.findUnique({
    where: { name: province },
  });
  if (verifyProvince === null) {
    return new Response(JSON.stringify({ error: "Province not found" }), {
      status: 400,
      headers: {
        "Content-Type": "application/json",
      },
    });
  }
  const newProduct = await db.product.create({
    data: {
      name,
      detail,
      price,
      place_of_sele_id: verifyProvince.id,
      image,
      stock,
    },
  });
  return new Response(JSON.stringify(newProduct), {
    status: 201,
    headers: {
      "Content-Type": "application/json",
    },
  });
}
