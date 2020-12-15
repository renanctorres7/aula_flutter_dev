import 'package:aula_flutter_dev/data/http/http.dart';
import 'package:aula_flutter_dev/data/usecases/remote_authentication.dart';
import 'package:aula_flutter_dev/domain/usecases/authentication.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:faker/faker.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy httpClient;
  String url;
  RemoteAuthentication sut;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpsUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test("Should throw UnexpectedError if HttpClient returns 400", () async {
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method')))
        .thenThrow(HttpError.badRequest);

    final params = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());
    final future = sut.auth(params);

    expect(future, matcher);
  });
}
