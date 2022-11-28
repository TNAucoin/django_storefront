from django.shortcuts import render
from store.models import Product, Customer, Collection, Order, OrderItem

# Create your views here.
def say_hello(request):
    # Customers who's email contains .com
    customer_query_set = Customer.objects.filter(email__contains=".com")
    for customer in customer_query_set:
        print(customer.email)

    # Collections with featured product == null
    collection_query_set = Collection.objects.filter(featured_product__isnull=True)
    for collection in collection_query_set:
        print(collection.title)

    # Products with inventory less than 10
    product_query_set = Product.objects.filter(inventory__lt=10)
    for product in product_query_set:
        print(product.title + " " + str(product.inventory))

    # Orders placed by a customer with ID of 1
    order_query_set = Order.objects.filter(customer__id__exact=1)
    for order in order_query_set:
        print(order.customer.first_name + " " + order.payment_status)

    # Order items where the product belongs to collection 3
    order_items_queryset = OrderItem.objects.filter(product__collection__exact=3)
    for order_item in order_items_queryset:
        print(order_item.product.title + " " + str(order_item.product.collection.id))

    return render(request, "hello.html")
