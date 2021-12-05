import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MockGoogleSignIn googleSignIn;
  setUp(() {
    googleSignIn = MockGoogleSignIn();
  });

// deve retornar idToken e accessToken ao autenticar
  test('should return idToken and accessToken when authenticating', () async {
    final signInAccount = await googleSignIn.signIn();
    final signInAuthentication = await signInAccount!.authentication;
    expect(signInAuthentication, isNotNull);
    expect(googleSignIn.currentUser, isNotNull);
    expect(signInAuthentication.accessToken, isNotNull);
    expect(signInAuthentication.idToken, isNotNull);
  });

// deve retornar nulo quando o login do Google for cancelado pelo usuário
  test('should return null when google login is cancelled by the user',
      () async {
    googleSignIn.setIsCancelled(true);
    final signInAccount = await googleSignIn.signIn();
    expect(signInAccount, isNull);
  });

  // testar o login do google duas vezes, uma vez cancelado, uma vez que não foi cancelado no mesmo teste
  test(
      'testing google login twice, once cancelled, once not cancelled at the same test.',
      () async {
    googleSignIn.setIsCancelled(true);
    final signInAccount = await googleSignIn.signIn();
    expect(signInAccount, isNull);
    googleSignIn.setIsCancelled(false);
    final signInAccountSecondAttempt = await googleSignIn.signIn();
    expect(signInAccountSecondAttempt, isNotNull);
  });
}
