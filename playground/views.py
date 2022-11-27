from django.shortcuts import render
from django.http import HttpResponse
from store.models import Customer

# Create your views here.
def say_hello(request):
    query_set = Customer.objects.all()
    for customer in query_set:
        print(customer.first_name)
    return HttpResponse("Hello World")
