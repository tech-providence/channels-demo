import axios from "axios";
import { dispatchUrl } from "../services.js";

const sendRequest = () => {
  return axios
    .get(`http://${dispatchUrl}/send?id=1`)
    .then(res => console.log(res))
    .catch(err => console.log(err));
};

export { sendRequest };
