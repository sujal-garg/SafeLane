// ignore_for_file: file_names, non_constant_identifier_names


class Contents{
  final String image, title, description;
  Contents({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Contents> Demo_data=[
  Contents(
    image: "assets/images/undraw_current_location_re_j130.svg", 
    title: "Mark any barrier on the road", 
    description: ""),
  Contents(
    image: "assets/images/undraw_location_search_re_ttoj.svg", 
    title: "Search safe road for a better \njourney", 
    description: ""),
  Contents(
    image: "assets/images/undraw_navigator_a479.svg", 
    title: "Get to your place without \nany barrier", 
    description: ""),

];