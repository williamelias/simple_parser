from rest_framework import serializers
from research.models import UF

class UFSerializer(serializers.ModelSerializer):
    class Meta:
        fields = "__all__"
        model = UF