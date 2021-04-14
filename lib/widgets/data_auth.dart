import 'package:flutter/material.dart';
import 'package:web_chat/widgets/widgets.dart';

class DataWidget extends StatelessWidget {
  final TextEditingController nameController;
  final Function selectImage;
  final Authorization auth;
  final String emptyName;
  final Function onSubmit;

  DataWidget(
      {this.nameController,
      this.selectImage,
      this.auth,
      this.emptyName,
      this.onSubmit});

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
                  : NetworkImage(defaultPhotoUser),
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
              onSubmitted: onSubmit,
              key: UniqueKey(),
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                errorText: emptyName,
                hintText: "Full Name",
              ),
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
