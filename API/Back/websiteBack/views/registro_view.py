from rest_framework.decorators import api_view
from rest_framework.response import Response
from ..models.registro import RelatorioCadop
from ..serializers.registro_serializer import RelatorioCadopSerializer

@api_view(['GET'])
def listar_relatorios(request):
    relatorios = RelatorioCadop.objects.all()
    serializer = RelatorioCadopSerializer(relatorios, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def buscar_por_registro_ans(request, registro_ans):
    try:
        relatorio = RelatorioCadop.objects.get(Registro_ANS=registro_ans)
        serializer = RelatorioCadopSerializer(relatorio)
        return Response(serializer.data)
    except RelatorioCadop.DoesNotExist:
        return Response({'error': 'Registro não encontrado'}, status=404)
