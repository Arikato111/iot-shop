import jwt from "jsonwebtoken";
export const JwtGenerate = (data: {
  id: number;
  name: string;
  email: string;
  phone: string;
  rank: boolean;
}) => {
  const token = jwt.sign(
    data,
    process.env.JWT_SECRET_KEY ?? "defaultsecretkey",
    {
      expiresIn: "1d",
    }
  );
  return token;
};

export const JwtCheck = (token: string) => {
  return jwt.verify(
    token,
    process.env.JWT_SECRET_KEY ?? "defaultsecretkey",
    (err, decoded) => {
      if (err) return { status: false };
      return { status: true, data: decoded };
    }
  );
};
