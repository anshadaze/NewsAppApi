import 'package:newsapp/models/categoryModel/categoryModel.dart';

  List<CategoryModel>categories=[];
List<CategoryModel> getCategories() {
  CategoryModel categoryModel=CategoryModel();
  //1
  categoryModel.categoryName = 'Bussines';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1776&q=80';
      categories.add(categoryModel);
      categoryModel=new CategoryModel();


      // 2
categoryModel = CategoryModel(); 
categoryModel.categoryName ='Entertaiment';
categoryModel.imageUrl='https://images.unsplash.com/photo-1586899028174-e7098604235b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80';
categories.add(categoryModel);

// 3
categoryModel = CategoryModel(); 
categoryModel.categoryName ='Genaral';
categoryModel.imageUrl='https://images.unsplash.com/photo-1554228243-ff1759819ed3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1173&q=80';
categories.add(categoryModel);

// 4
categoryModel = CategoryModel(); 
categoryModel.categoryName ='Helth';
categoryModel.imageUrl='https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80';
categories.add(categoryModel);

// 5
categoryModel = CategoryModel(); 
categoryModel.categoryName ='Scinece';
categoryModel.imageUrl='https://images.unsplash.com/photo-1583607264434-2d8e199b3a17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80';
categories.add(categoryModel);


return categories;
}


