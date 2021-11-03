abstract class AppStates {}

class IntitailAppStates extends AppStates {}

class ChangeAppTheme extends AppStates {}

class SearchLoadStates extends AppStates {}

class SearchSucsessStates extends AppStates {}

class SearchErorrStates extends AppStates {
  final String error;

  SearchErorrStates(this.error);
}
