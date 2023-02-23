from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView


class TokenAuthenticationView(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(
            data={'username': request.data.get('username'), 'password': request.data.get('password')})
        serializer.is_valid(raise_exception=True)

        user = serializer.validated_data['user']
        Token.objects.filter(user=user).delete()

        token = Token.objects.create(user=user)
        return Response({'token': token.key})


class Logout(APIView):
    def get(self, request, format=None):
        request.user.auth_token.delete()
        return Response(status=status.HTTP_200_OK)
