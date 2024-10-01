/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var req;
var isIE;
var completeField;
var serchField;
var searchFName;
var searchLName;
var searchDate;


function init() {
    completeField = document.getElementById("complete-field");
   /* completeTable = document.getElementById("complete-table");
    autoRow = document.getElementById("auto-row");
    completeTable.style.top = getElementY(autoRow) + "px";*/
  
}

function doCompletion() {
    console.log("doCompletion called with value: " + completeField.value);

    var url;

    if (event.keyCode == 13) {
        url = "autocomplete?action=lookup&id=" + escape(completeField.value);
    } else {
        url = "autocomplete?action=complete&id=" + escape(completeField.value);
    }

    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function performSearch() {
    var servletMapping = "/autocomplete"; // Change this to the actual mapping of your servlet
    var url = servletMapping + "?action=lookup&id=" + encodeURIComponent(document.getElementById("complete-field").value);

    // Set the form's action attribute
    document.getElementById("autofillform").action = url;

    // Submit the form
    document.getElementById("autofillform").submit();

}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function callback() {
     

    if (req.readyState == 4) {
        if (req.status == 200) {
           
           parseMessages(req.responseXML);
          
    }
}
}

function appendProducts(productName,productCategory,productId,productPrice,productOriginalPrice,productImage,productDiscountStatus) {

    productListContainer.style.display = 'flex';  
    
     var newProductCardWrapper = document.createElement('div');
     newProductCardWrapper.className = 'product-card-wrapper w-dyn-item';

     
    var newLinkToProductStore = document.createElement('a');
    newLinkToProductStore.id = 'LinkToProductStoreJavaScript';
    newLinkToProductStore.href = 'SingleProductServlet?productID=' + productId;
    newLinkToProductStore.className = 'product-card w-inline-block';
    
    var newProductImageStore = document.createElement('img');
    newProductImageStore.id = 'productImageStoreJavaScript';
    newProductImageStore.src = 'data:image/jpeg;base64,' + productImage;
    newProductImageStore.alt = '';
    
    var newProductNameStore = document.createElement('h6');
    newProductNameStore.id = 'ProductNameStoreJavaScript';
    newProductNameStore.className = 'product-card-heading';
    newProductNameStore.textContent = productName;
    
    if (productDiscountStatus === "Reduced To Clear" || productDiscountStatus === "Fire Sale"){
    var newReductionOfTheProduct = document.createElement('h6');
    newReductionOfTheProduct.id = 'ReductionOfTheProductJavaScript';
    newReductionOfTheProduct.className = 'product-card-heading';
    newReductionOfTheProduct.textContent = 'Reduced from €' + productOriginalPrice;
    }
    
    var newProductPriceStore = document.createElement('div');
    newProductPriceStore.id = 'ProductPriceStoreJavScript';
    newProductPriceStore.className = 'product-card-price';
    newProductPriceStore.textContent = '€' + productPrice;

    newLinkToProductStore.appendChild(newProductImageStore);
    newLinkToProductStore.appendChild(newProductNameStore);
     if (productDiscountStatus === "Reduced To Clear" || productDiscountStatus === "Fire Sale"){
    newLinkToProductStore.appendChild(newReductionOfTheProduct);
     }
    newLinkToProductStore.appendChild(newProductPriceStore);
    newProductCardWrapper.appendChild(newLinkToProductStore);
    productListContainer.appendChild(newProductCardWrapper);


}






function parseMessages(responseXML) {
    // no matches returned
    if (responseXML == null) {
        return false;
    } else {
        var products = responseXML.getElementsByTagName("Product")[0];

      
    // The search bar is not empty, hide the product list
     productListContainer = document.querySelector('.products.w-dyn-items');
      if (productListContainer) {
        productListContainer.style.display = 'none';
    }
    productListContainer.innerHTML = '';
    
  
         
        if (products.childNodes.length > 0) {
        

            for (var loop = 0; loop < products.childNodes.length; loop++) {
                var product = products.childNodes[loop];
                var productName = product.getElementsByTagName("ProductName")[0];
                var productCategory = product.getElementsByTagName("Category")[0];
                var productId = product.getElementsByTagName("id")[0];
                var productPrice = product.getElementsByTagName("Price")[0];
                var productPriceOriginal = product.getElementsByTagName("ProductOriginalPrice")[0];
                var productImage = product.getElementsByTagName("Image")[0];
                var productDiscountStatus = product.getElementsByTagName("DiscountStatus")[0];
                
                appendProducts(
                    productName.childNodes[0].nodeValue,
                    productCategory.childNodes[0].nodeValue,
                    productId.childNodes[0].nodeValue,
                    productPrice.childNodes[0].nodeValue,
                    productPriceOriginal.childNodes[0].nodeValue,
                    productImage.childNodes[0].nodeValue,
                    productDiscountStatus.childNodes[0].nodeValue
                );
            }
   }       else if (products.getAttribute("found") === "false") {
                var noProductsMessage = document.createElement('h4');
                noProductsMessage.id = "ProductNotThere";
                noProductsMessage.textContent = 'No Products Found.';
                productListContainer.appendChild(noProductsMessage);
}

    }
}



