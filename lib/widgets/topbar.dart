import 'package:flutter/material.dart';

//models
import '../model/search_category.dart';

class topBar extends StatelessWidget {
 late double deviceHeight;
  late double deviceWidth;
  late TextEditingController searchTextFieldController;
 @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    searchTextFieldController = TextEditingController();
    return  topBarWidget();
  }
  Widget topBarWidget()
  {
    return Container(
      height: deviceHeight*0.08 ,
      decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }
  Widget _categorySelectionWidget(){
   return DropdownButton(
     dropdownColor: Colors.black38,
     value: SearchCategory.popular,
     icon: const Icon(Icons.menu,color: Colors.white24,),
     underline: Container(height: 1,color:Colors.white24),
     onChanged: (_value){},
     items: const [
       DropdownMenuItem(value:SearchCategory.popular ,child: Text(SearchCategory.popular,style: TextStyle(color:Colors.white),),),
       DropdownMenuItem(value:SearchCategory.upComing, child: Text(SearchCategory.upComing,style: TextStyle(color:Colors.white),) ),

     ],

   );
  }
  Widget _searchFieldWidget()
  {
    const border = InputBorder.none;
    return SizedBox(
      width: deviceWidth*0.50,
      height: deviceHeight*0.05,
      child: TextField(
        controller: searchTextFieldController,
        onSubmitted: (input){},
        style: const TextStyle(color:Colors.white),
        decoration: const InputDecoration(
            focusedBorder: border,
            border: border,
            prefixIcon:Icon(Icons.search,color: Colors.white24,),
            hintStyle:TextStyle(color:Colors.white54),
            filled: false,
            fillColor: Colors.white24,
            hintText: 'Search...'

        ),
      ),
    );
  }
}
