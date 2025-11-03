import { NextRequest } from "next/server";
import { PrismaClient } from "@/generated/prisma/client";
import { SHA1 } from "crypto-js";

export async function POST(request: NextRequest) {
  const db = new PrismaClient();
  const response = await request.json();
  const { name, email, password, phone, address, province } = response;
  if (!name || !email || !password || !phone || !address || !province) {
    return new Response(
      JSON.stringify({ message: "All fields are required" }),
      { status: 400 }
    );
  }

  const passwordHash = SHA1(password).toString();
  const provinceCheck = await db.province.findFirst({
    where: { name: province },
  });
  if (!provinceCheck) {
    return new Response(JSON.stringify({ message: "Province not found" }), {
      status: 404,
    });
  }

  await db.user.create({
    data: {
      name,
      email,
      password: passwordHash,
      phone,
      address,
      province_id: provinceCheck.id,
      rank: false,
    },
  });
  return new Response(JSON.stringify({ msg: "Register success" }), {
    status: 201,
  });
}
