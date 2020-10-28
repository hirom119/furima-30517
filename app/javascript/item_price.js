window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
 const addProfitDom = document.getElementById("profit");


priceInput.addEventListener("input",()=>{

  const inputValue = priceInput.value;

  //計算
  const tax = Math.floor(inputValue * 0.1);


  //手数料と利益を貼り付ける
  addTaxDom.textContent = tax;
  const profit = Math.floor(inputValue * 0.9);

  addProfitDom.textContent = profit;
});
});