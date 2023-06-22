import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageLoader extends StatefulWidget {
  final String imageUrl;
  final String localImageUrl;

  ImageLoader({required this.imageUrl, required this.localImageUrl});

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late ImageProvider currentImageProvider;

  @override
  void initState() {
    super.initState();
    currentImageProvider = AssetImage(widget.localImageUrl);
    checkNetworkStatus();
  }

  void checkNetworkStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      loadImage();
    }
  }

  void loadImage() {
    Image.network(widget.imageUrl)
        .image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener(
            (info, syncCall) {
              if (mounted) {
                setState(() {
                  currentImageProvider = NetworkImage(widget.imageUrl);
                });
              }
            },
            onError: (exception, stackTrace) {
              print('Failed to load network image: $exception');
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Image(image: currentImageProvider, fit: BoxFit.cover);
  }
}
