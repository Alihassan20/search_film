import 'package:flutter/material.dart';
import 'package:search_film/model/film_model.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
   static List<filmDetails> filmList = [
     filmDetails(title: ' The Shawshank Redemption', subTitle: 'Morgan Freeman and Tim Robbins in The Shawshank Redemption (1994)', rating: 9.2, imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/thumb/d/d0/%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg/260px-%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg'),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg'),
     filmDetails(title: 'The Dark Knight', subTitle: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', rating: 9.0, imageUrl: 'https://www.space-figuren.de/images/product_images/info_images/17457_0.jpg'),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg'),

     filmDetails(title: ' The Shawshank Redemption', subTitle: 'Morgan Freeman and Tim Robbins in The Shawshank Redemption (1994)', rating: 9.2, imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/thumb/d/d0/%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg/260px-%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg'),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg'),
     filmDetails(title: 'The Dark Knight', subTitle: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', rating: 9.0, imageUrl: 'https://www.space-figuren.de/images/product_images/info_images/17457_0.jpg'),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg'),

     filmDetails(title: ' The Shawshank Redemption', subTitle: 'Morgan Freeman and Tim Robbins in The Shawshank Redemption (1994)', rating: 9.2, imageUrl: 'https://upload.wikimedia.org/wikipedia/ar/thumb/d/d0/%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg/260px-%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg'),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg'),
     filmDetails(title: 'The Dark Knight', subTitle: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', rating: 9.0, imageUrl: 'https://www.space-figuren.de/images/product_images/info_images/17457_0.jpg'),
     filmDetails(title: ' The Godfather', subTitle: 'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.', rating: 9.2, imageUrl: 'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg'),

   ];
  List<filmDetails> displayFilm = List.from(filmList);

  void selectedFilm(String val){
    setState(() {
      displayFilm= filmList.where((element) => element.title.toLowerCase().contains(val.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(21, 19, 60, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 19, 60, 1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Search For Your Favorit Movies",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
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
            Expanded(child: ListView.builder(
              itemCount: displayFilm.length,
                itemBuilder: (context, index) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(displayFilm[index].title,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                ),

                subtitle: Text(displayFilm[index].subTitle,style: TextStyle(color: Colors.white70,fontSize: 14),maxLines: 2,overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(displayFilm[index].rating.toString(),style: TextStyle(color: Colors.yellow),),
                leading: Image.network(displayFilm[index].imageUrl,height: 80,width: 50,),

              );
            }))


          ],
        ),
      ),
    );
  }
}
