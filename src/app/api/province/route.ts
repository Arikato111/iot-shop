import db from "@/models/prismaClient";

export async function GET() {
  const provinces = await db.province.findMany();
  return new Response(JSON.stringify(provinces), {
    headers: { "Content-Type": "application/json" },
  });
}

export async function POST(request: Request) {
  const { name } = await request.json();
  const newProvince = await db.province.create({
    data: { name },
  });
  return new Response(JSON.stringify(newProvince), {
    headers: { "Content-Type": "application/json" },
    status: 201,
  });
}
