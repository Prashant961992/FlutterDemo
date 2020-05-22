
enum Routes {
  MyApp,
  LoginController,
  HomeView,
}

String getScreenName(Routes route) {
   switch(route) {
      case Routes.MyApp: 
        return "/root";
      case Routes.LoginController: 
        return "/login";
      case Routes.HomeView: 
        return "/home";  
      default:
        return "";
    }
}