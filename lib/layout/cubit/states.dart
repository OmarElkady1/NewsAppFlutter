abstract class NewsStates {}
  class InitialStatess extends NewsStates{}
  class BottomNavigationStates extends NewsStates{}

  class BusinessLoadStates extends NewsStates{}
  class BusinessSucsessStates extends NewsStates{}
  class BusinessErorrStates extends NewsStates{
    final String error;

    BusinessErorrStates(this.error);
  }

class SportsLoadStates extends NewsStates{}
class SportsSucsessStates extends NewsStates{}
class SportsErorrStates extends NewsStates{
  final String error;

  SportsErorrStates(this.error);
}

class SciencesLoadStates extends NewsStates{}
class SciencesSucsessStates extends NewsStates{}
class SciencesErorrStates extends NewsStates{
  final String error;

  SciencesErorrStates(this.error);
}
class SearchLoadStates extends NewsStates{}
class SearchSucsessStates extends NewsStates{}
class SearchErorrStates extends NewsStates{
  final String error;

  SearchErorrStates(this.error);
}

