import 'package:fluboard/data/datasource/remote/authenticated_client.dart';
import 'package:googleapis/people/v1.dart';

class GooglePeopleService {
  PeopleServiceApi service() => PeopleServiceApi(AuthenticatedClient());

  Future<Person> getPerson() =>
      service().people.get('people/me', personFields: 'names,emailAddresses,photos');
}
