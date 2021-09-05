window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    taxPrice = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = taxPrice;
    const profitPrice = document.getElementById("profit");
    console.log(profitPrice);
    profitPrice.innerHTML = Math.floor(inputValue - taxPrice);
  })
})