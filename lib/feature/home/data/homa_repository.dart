class HomeRepository{
  bool isSecondScreen = false;
  bool showBottomSheet = false;

  int selectedTab = 2;

  void setIsSecondScreen(bool f) => isSecondScreen = f;

  void onSelectTab(int index) {
    if (selectedTab == index) return;
      setIsSecondScreen(index != 2);
    selectedTab = index;
  }
}