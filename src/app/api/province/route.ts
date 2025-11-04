import db from "@/models/prismaClient";

export async function GET() {
    const provinces =await db.province.findMany();
   return new Response(JSON.stringify(provinces), {
        headers: { 'Content-Type': 'application/json' },
    });
}