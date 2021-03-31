import 'package:flutter/material.dart';
import 'package:web_chat/widgets/widgets.dart';

class DataWidget extends StatelessWidget {
  final TextEditingController nameController;
  final Function selectImage;
  final Authorization auth;

  DataWidget({this.nameController, this.selectImage, this.auth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          InkWell(
            onTap: selectImage,
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage: (auth.dataPhoto != null)
                  ? MemoryImage(auth.dataPhoto)
                  : NetworkImage(
                      "https://user-images.githubusercontent.com/36184953/107140001-0275d700-6941-11eb-9766-2605c4948e27.jpg"),
              child: (auth.dataPhoto == null)
                  ? Icon(
                      Icons.add_a_photo_outlined,
                      size: 30,
                      color: Colors.blue,
                    )
                  : SizedBox(),
            ),
          ),
          SizedBox(
            height: 80.0,
          ),
          SizedBox(
            height: 50.0,
            child: TextField(
              key: UniqueKey(),
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(hintText: "Full Name"),
              controller: nameController,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
