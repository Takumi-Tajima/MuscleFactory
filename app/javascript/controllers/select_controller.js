import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="select"
export default class extends Controller {
    static values = {
        options: Array
    }

    connect() {
        new TomSelect(this.element, {
            persist: false,
            createOnBlur: true,
            create: true,
            options: this.hasOptionsValue ? this.optionsValue : []
        });
    }
}
