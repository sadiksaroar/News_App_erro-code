import 'package:flutter/material.dart';
import 'package:news_app/components/news_item.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/api_service.dart';

class AllNewsDart extends StatefulWidget {
  const AllNewsDart({super.key});

  @override
  State<AllNewsDart> createState() => _AllNewsDartState();
}



class _AllNewsDartState extends State<AllNewsDart> {

    ApiService apiService = ApiService();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
      future: apiService.getAllNews(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          List<NewsModel>articleList = snapshot.data ?? [];

          return ListView.builder(itemBuilder: (context, index){

            //item
            return NewsItemList(newsModel: articleList[index],);

          },
          
          itemCount: articleList.length,
          
          );
        }
        return const Center(
          child: CircleAvatar(),
        );
      },
      ),
    );
  }
}