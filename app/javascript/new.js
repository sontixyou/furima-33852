function calculation(){
  const price = document.getElementById("item-price");
  
  price.addEventListener("input", () => {
    const priceNumber = Number(price.value);
    const priceTax = priceNumber * 0.1;
    const priceProfit = priceNumber - priceTax;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${Math.floor(priceTax)}`;
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = `${Math.floor(priceProfit)}`;
  });
}

window.addEventListener('load', calculation);