from rest_framework import serializers
from django.core.serializers import serialize
from .models import Order, Product



class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = (
            "pk",
            "name",
            "description",
            "price",
            "discount",
            "created_at",
            "archived",
            "preview",
        )

def serialize_orders(orders):
    return serialize('json', orders)