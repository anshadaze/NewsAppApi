import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl,categoryName;
  const CategoryTile({super.key,
  this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children:<Widget> [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,)),
           Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(6),
              color: Colors.black26,
            ),
            width: 120,height: 60,
            
            child: Text(categoryName,style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),),
           )
          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {
  

  final imageUrl,title,desc;
   BlogTile({super.key,
  required this.imageUrl,required this.title,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(6) ,
            child: Image.network(imageUrl)),
          SizedBox(height: 10,),
          Text(title,style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black87
          ),),
          SizedBox(height: 10,),
          Text(desc,style: TextStyle(
            color: Color.fromARGB(123, 51, 46, 46)
          ),)
        ],
      ),
    );
  }
}