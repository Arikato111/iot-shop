import { NextRequest } from "next/server";
import db from "@/models/prismaClient";
import { SHA1 } from "crypto-js";
import { JwtGenerate } from "../../../../utils/jwt";

export async function POST(request: NextRequest) {
  const response = await request.json();
  const { email, password } = response;

  if (!email || !password) {
    return new Response(
      JSON.stringify({ message: "Email and password are required" }),
      { status: 400 }
    );
  }

  const user = await db.user.findFirst({ where: { email } });
  if (!user) {
    return new Response(JSON.stringify({ message: "User not found" }), {
      status: 404,
    });
  }

  const passwordHash = SHA1(password).toString();
  console.log(user.password, ":", passwordHash);
  if (user.password !== passwordHash) {
    return new Response(JSON.stringify({ message: "Invalid credentials" }), {
      status: 401,
    });
  }

  const data = {
    id: user.id,
    name: user.name,
    email: user.email,
    rank: user.rank,
    province_id: user.province_id,
    address: user.address,
    phone: user.phone,
  };
  const token = JwtGenerate(data);
  return new Response(JSON.stringify({ token }), { status: 200 });
}
