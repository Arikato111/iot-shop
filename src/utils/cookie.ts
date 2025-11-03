import Cookies from "js-cookie";
import { jwtDecode } from "jwt-decode";
class userCookie {
  token = "";
  constructor() {
    this.token = Cookies.get("token") ?? "";
  }
  decode() {
    if (!this.token) return null;
    return jwtDecode(this.token)
  }
  isLogin() {
    return !!this.token;
  }
  store(token: string) {
    Cookies.set("token", token, { expires: 1 });
  }
  delete() {
    Cookies.remove("token");
  }
}

export default userCookie;
