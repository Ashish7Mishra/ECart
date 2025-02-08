function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    
    if (cart == null) {
        // No cart yet, create one
        let products = [];
        let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        showToast("Item is added to cart");
    } else {
        // Cart is already present, check for existing product
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid);

        if (oldProduct) {
            // We have to increase the quantity of the existing product
            oldProduct.productQuantity = oldProduct.productQuantity + 1;

            // Update the cart with the new quantity
            localStorage.setItem("cart", JSON.stringify(pcart));
            
            showToast(`${oldProduct.productName} quantity increased. Quantity: ${oldProduct.productQuantity}`);
        } else {
            // Product not in cart, so add it
            let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            
            showToast(`${pname} is added to cart`);
        }
    }
    updateCart();  // Update the cart display after adding/updating
}

// Update the cart display
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart == null || cart.length == 0) {
        console.log("Cart is empty");
        $(".cart-items").html("(0)");  // Update the cart count in the UI
        $(".cart-body").html("<h3>Your cart does not have any items</h3>");
        $(".Checkout-btn").attr('disabled', true);
    } else {
        // Display items in the cart
        $(".cart-items").html(`(${cart.length})`);  // Update cart item count

        let table = `
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>`;

        let totalPrice = 0;

        cart.forEach((item) => {
            table += `
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>`;
            totalPrice += item.productQuantity * item.productPrice;
        });

        table += `
            </tbody>
            <tfoot>
                <tr>
                    <td colspan='5' class='text-right font-weight-bold'>Total Price: ${totalPrice}</td>
                </tr>
            </tfoot>
        </table>`;

        $(".cart-body").html(table);  // Update the cart table
        $(".Checkout-btn").attr('disabled', false);  // Enable checkout button
    }
}

// Delete item from cart
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId !== pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();  // Refresh the cart display after deletion
    showToast("Item removed from cart");
}

// Show toast notification
function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

// Redirect to checkout page
function goToCheckout() {
    window.location = "checkout.jsp";
}

$(document).ready(function() {
    updateCart();  // Update cart on page load
});
