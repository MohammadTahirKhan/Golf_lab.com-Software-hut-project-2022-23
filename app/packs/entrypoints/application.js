import Rails from "@rails/ujs";
import "bootstrap";
import removeFlashMsg from "../scripts/layout";

window.removeFlashMsg = removeFlashMsg;

Rails.start();
