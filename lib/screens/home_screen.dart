import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:translation_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  final fromTextController=TextEditingController();
  final toTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Text Translation",
          style: TextStyle(color: AppColors.appWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [commonLineWidget(context),
            toAndFromLanguageWidget("Enslish","","Malaylam","",context),
            languageIndicatorText("English","From"),
            transaltionTextBoxWidget(context,fromTextController,false),
            languageIndicatorText("Malayalam","To"),
            transaltionTextBoxWidget(context,toTextController,true)],
          ),
        ),
      ),
    );
  }

  Widget commonLineWidget(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: AppColors.appGrey,
    );
  }


  Widget toAndFromLanguageWidget(String toLanguage,String toIcon,String fromLangugae,String fromIcon,BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:23.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          languageBox(context,fromLangugae ),
          Icon(Icons.compare_arrows_sharp,color: AppColors.appWhite,),
          languageBox(context, toLanguage),

          
        ],
      ),
    );

  }

  Widget languageBox(BuildContext context,language){
    return InkWell(
      onTap: (){
        // Open language bottom sheet
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
          
            decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 46, 46, 46),
      ),
            height: MediaQuery.of(context).size.height*0.65,
            width: MediaQuery.of(context).size.width,
            child: languageBottomSheet(context));
        },
        isScrollControlled: true,
        backgroundColor: Colors.transparent);

      },
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width/2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(73, 120, 119, 119),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text(language,style: TextStyle(color: AppColors.appWhite),),
              ),
            ],
          ),
        ),
    
      ),
    );
  }


  Widget languageIndicatorText(String language,String fromOrTo){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:23.0),
      child: Text("Translate $fromOrTo ($language)",style: TextStyle(
        color: AppColors.appWhite
      ),),
    );
  }


  Widget transaltionTextBoxWidget(BuildContext context, TextEditingController controller,bool isReadOnly){
    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
       color: const Color.fromARGB(73, 120, 119, 119),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:14.0,left: 14,right: 14),
        child: TextField(
          controller:controller ,
          maxLength: 2300,
          maxLines: 6,
          readOnly:isReadOnly ,
          decoration:  InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appGrey)
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appGrey)
            ),
            
            contentPadding: const EdgeInsets.all(4)
          ),
      
        ),
      ),
    );
  }


  Widget languageBottomSheet(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top:23.0,left: 23,right: 23,bottom: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("From",style: TextStyle(
              color: AppColors.appGrey,fontSize: 14,
              fontWeight: FontWeight.w400
            ),),
        
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 18),
              child: SizedBox(
               
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for languages",
                    hintStyle: TextStyle(color: AppColors.appGrey),
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(Icons.search,color: AppColors.appWhite,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.appGrey)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.appGrey)
            
                    )
                  ),
                ),
              ),
            ),
            Text("All Languages",style: TextStyle(
              color: AppColors.appGrey,fontSize: 14,
              fontWeight: FontWeight.w400
            ),),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return searchLanguageTile(context,"English");
              },
              itemCount: 8,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),),
            )
          ],
          
        ),
      ),
     

    );
  }


  Widget searchLanguageTile(BuildContext context,String language){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          height: 48,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(73, 120, 119, 119),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(language,style: TextStyle(color: AppColors.appWhite),),
                ),
              ],
            ),
          ),
      
        ),
    );
  }
}
