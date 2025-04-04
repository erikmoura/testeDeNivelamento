from rest_framework import serializers
from ..models.registro import RelatorioCadop

class RelatorioCadopSerializer(serializers.ModelSerializer):
    class Meta:
        model = RelatorioCadop
        fields = '__all__'
