window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;

    tax = 0.1
    taxPrice = Math.floor(inputValue * tax);
    addTaxPrice.innerHTML = taxPrice;

    profit.innerHTML = (inputValue - taxPrice);
  })
})