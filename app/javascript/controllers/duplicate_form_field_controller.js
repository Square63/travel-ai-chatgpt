import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  clone() {
    let originalDiv = document.getElementById("original");
    let newDiv = originalDiv.cloneNode(true);

    document.getElementById("parent-container").appendChild(newDiv);
  }
}
