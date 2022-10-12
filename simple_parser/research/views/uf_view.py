from rest_framework import  viewsets
from research.models import UF
from research.serializers.uf_serializer import UFSerializer

class UFViewSet(viewsets.ModelViewSet):
    queryset = UF.objects.all()
    serializer_class = UFSerializer