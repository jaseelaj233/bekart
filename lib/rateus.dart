import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shop rating'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text('would you like to this play store'),
          Text('your feedback help us make your experience better'),
          SizedBox(),
          SizedBox(
            height: 30,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return IconButton(
                      onPressed: () {}, icon: Icon(Icons.star_border_outlined));
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 5),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 144, 142, 139),
              hintText: 'write somthing......',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 150,
            child: TextButton(
                onPressed: () {},
                child: Text('Add feedback'),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.black,
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                )),
          ),
        ]),
      ),
    );
  }
}
