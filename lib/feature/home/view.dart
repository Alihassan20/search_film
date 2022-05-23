import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_film/core/const.dart';
import 'package:search_film/model/film_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {


  static List<filmDetails> filmList = [
     filmDetails(title: ' The Shawshank Redemption', subTitle: 'Morgan Freeman and Tim Robbins in The Shawshank Redemption (1994)', rating: 9.2, imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/thumb/d/d0/%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg/260px-%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg', Url:"https://www.imdb.com/video/vi3877612057/?playlistId=tt0111161&ref_=tt_pr_ov_vi" ),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg',Url: "https://www.imdb.com/video/vi1348706585/?playlistId=tt0068646&ref_=tt_pr_ov_vi"),
     filmDetails(title: 'The Dark Knight', subTitle: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', rating: 9.0, imageUrl: 'https://www.space-figuren.de/images/product_images/info_images/17457_0.jpg',Url: "https://www.imdb.com/video/vi324468761/?playlistId=tt0468569&ref_=tt_ov_vi"),
    filmDetails(title: ' 12 Angry Men', subTitle: 'The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.', rating: 9.0, imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/f/f5/Twelve_angry_men.jpg', Url: 'https://www.imdb.com/video/vi2924462873/?playlistId=tt0050083&ref_=tt_ov_vi'),
    filmDetails(title: " Schindler's List", Url: 'https://www.imdb.com/video/vi1158527769/?playlistId=tt0108052&ref_=tt_pr_ov_vi', subTitle: 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', rating: 9.0,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/9/94/%D9%82%D8%A7%D8%A6%D9%85%D8%A9_%D8%B4%D9%86%D8%AF%D9%84%D8%B1.jpg'),
    filmDetails(title: 'Pulp Fiction', Url: 'https://www.imdb.com/video/vi2620371481/?playlistId=tt0110912&ref_=tt_ov_vi', subTitle: 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', rating: 8.9,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Dipinto_di_Pulp_Fiction.jpg/640px-Dipinto_di_Pulp_Fiction.jpg'),    filmDetails(title: 'Forrest Gump', Url: 'https://www.imdb.com/video/vi3567517977/?playlistId=tt0109830&ref_=tt_ov_vi', subTitle: 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', rating: 8.8,
        imageUrl:'https://upload.wikimedia.org/wikipedia/ar/1/14/Forrest_Gum_(Poster).jpg'),
    filmDetails(title: 'Fight Club', Url: 'https://www.imdb.com/video/vi781228825/?playlistId=tt0137523&ref_=tt_ov_vi', subTitle: 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', rating: 8.8,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/1/1a/Fight_Club_Poster.jpg')
  ];
  List<filmDetails> displayFilm = List.from(filmList);

  void selectedFilm(String val){
    setState(() {
      displayFilm= filmList.where((element) => element.title.toLowerCase().contains(val.toLowerCase())).toList();
    });
  }

  _launchUrl(String url ) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView,
    )) throw 'Could not launch $url';
  }

   ScrollController scollBarController = ScrollController(initialScrollOffset: 50.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      appBar: AppBar(
        backgroundColor: myPrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search For Your Favorites Movies",style: TextStyle(color: kwhite,fontSize: 22,fontWeight: FontWeight.w600),),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value)=>selectedFilm(value),
              decoration:InputDecoration(
                focusColor: Colors.blueGrey,
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                ) ,
                fillColor: Colors.white70,
                  filled: true,
                  hintText: 'Select Any Film',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            const SizedBox(height: 30),
            Expanded(child: Scrollbar(
              controller: scollBarController,
              thickness: 5,
              trackVisibility:true,
              showTrackOnHover:true,
              interactive:true,
              radius: const Radius.circular(15),
              isAlwaysShown: true,
              child: ListView.builder(
                controller:scollBarController ,
                itemCount: displayFilm.length,
                  itemBuilder: (context, index) {
                return Card(
                  color: myPrimaryColor,
                  child: ListTile(
                    onTap:()=>_launchUrl(displayFilm[index].Url),
                    tileColor: Colors.white24,
                    contentPadding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(displayFilm[index].title,style: TextStyle(color: kwhite,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),

                    subtitle: Text(displayFilm[index].subTitle,style: const TextStyle(color: Colors.white70,fontSize: 14),maxLines: 2,overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.star, color: Colors.yellowAccent,),
                        SizedBox(height: 5),
                        Text(displayFilm[index].rating.toString(),style: TextStyle(color: Colors.yellow),),
                      ],
                    ),
                    leading: Image.network(displayFilm[index].imageUrl,height: 80,width: 50,),

                  ),
                );
              }),
            ))


          ],
        ),
      ),
    );
  }
}
