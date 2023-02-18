import 'package:flutter/material.dart';

class CreateNotionTile extends StatelessWidget {
  const CreateNotionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Clicked!');
        Navigator.pushNamed(context,'/write_here');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(

            color: Color(0xFF58AEFE),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create a new Notion',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),

                Icon(Icons.add,size: 40,)

              ],

            ),
          ),
        ),
      ),
    );
  }
}
