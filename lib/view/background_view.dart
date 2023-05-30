import 'package:firstappesin/view/custom_view_path.dart';
import 'package:flutter/material.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomPath(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/samurai.jpg"),
            fit: BoxFit.fill
          )
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
