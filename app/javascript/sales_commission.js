function sales_commission(){
  const price = document.getElementById("item-price");
  if (price.getAttribute("data-load") != null) {
    return null;
  }
  price.setAttribute("data-load", "true");

  price.addEventListener("change", (e) =>{
    const tax = document.getElementById("add-tax-price");
    const benefit = document.getElementById("profit");
    tax.innerHTML = `${(price.value * 0.1).toLocaleString()}`;
    benefit.innerHTML = `${(price.value-price.value * 0.1).toLocaleString()}`;
  })
};

if(document.URL.match("/items/new") || document.URL.match("/items/edit"))  {
  setInterval(sales_commission, 1000);
}
