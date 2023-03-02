import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rental-price"
export default class extends Controller {
  static targets = ['price', 'calculation', 'end_date', 'start_date']
  static values = { accprice: String}

  connect() {
    console.log("connected!")
  }

  calculateTotalPrice(event) {
    event.preventDefault()
    let start_date_parsed = new Date(this.start_dateTarget.value)
    start_date_parsed = Date.parse(start_date_parsed)
    let end_date_parsed = new Date(this.end_dateTarget.value)
    end_date_parsed = Date.parse(end_date_parsed)
    const diffDays = (end_date_parsed - start_date_parsed) / 86400000
    console.log(diffDays);

    if (Number.isInteger(diffDays) && diffDays>0) {
      this.calculationTarget.innerHTML = `Days: ${diffDays} * $${this.accpriceValue}`
      this.priceTarget.innerHTML = `Total Price: $${diffDays * this.accpriceValue}`
    }
  }
}
