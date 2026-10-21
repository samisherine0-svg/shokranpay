import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:pioneerspay/Provider/ProviderAccount.dart';

import '../../../Utils/AppUrl.dart';
import '../../../Utils/Colors/GeneralColor.dart';
import '../../../Utils/FontSizeFile.dart';
import '../../../Utils/Language/translation_strings.dart';

class PhotosSection extends StatefulWidget {
  @override
  State<PhotosSection> createState() => _PhotosSection();
}

class _PhotosSection extends State<PhotosSection> {
  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  String? _retrieveDataError;
  final ImagePicker _picker = ImagePicker();
  IconData icon = Icons.add_circle_outline_outlined;
  bool selectPhotosFirst = true;
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return selectPhotosFirst
        ? Container(
            height: 120,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images.length + 1,
                itemBuilder: (context, index) {
                  if (index == images.length) {
                    return selectItem();
                  }
                  return SizedBox();
                  // else {
                  //   return Container(
                  //     child: imagesTile(images[index]),
                  //   );
                  // }
                }),
          )
        : Container(
            child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                ? FutureBuilder<void>(
                    future: retrieveLostData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const Text(
                            'You have not yet picked an image.',
                            textAlign: TextAlign.center,
                          );
                        case ConnectionState.done:
                          return _previewImages();
                        default:
                          if (snapshot.hasError) {
                            return Text(
                              'Pick image/video error: ${snapshot.error}}',
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return Container();
                          }
                      }
                    },
                  )
                : _previewImages(),
          );
  }

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFileList = pickedFileList;
            List<String> listPhotos = [];
            for (int i = 0; i < _imageFileList!.length; i++) {
              listPhotos.add(_imageFileList!.elementAt(i).path);
              Provider.of<ProviderAccount>(context, listen: false)
                  .setPhotos(listPhotos);
            }
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    onPick(1000, 1000, 100);
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == _imageFileList!.length) {
              return selectItem();
            }
            return Container(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: kIsWeb
                    ? Image.network(
                        _imageFileList![index].path,
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                      )
                    : Image.file(
                        File(
                          _imageFileList![index].path,
                        ),
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                      ),
              ),
            );
          },
          itemCount: _imageFileList!.length + 1,
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget selectItem() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: GeneralColor.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: GeneralColor.appColor, width: 2),
        ),
        margin: const EdgeInsets.all(5),
        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: GeneralColor.appColor,
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Text(
              Translations.of(context)!.editPhotos,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: GeneralColor.appColor,
                  fontSize: FontSizeFile.s_size,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onTap: () {
        selectPhotosFirst = false;
        icon = Icons.edit;
        _onImageButtonPressed(
          ImageSource.gallery,
          context: context,
          isMultiImage: true,
        );
      },
    );
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      {
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {
            _imageFileList = response.files;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

// Widget imagesTile(String image) {
//   return Container(
//     margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//     child: ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(15.0)),
//       child: Image.network(
//         "https://" + AppUrl.AppDomain + image,
//         fit: BoxFit.fill,
//         width: 120,
//         height: 120,
//         errorBuilder: (context, error, stackTrace) {
//           // print(error); //do something
//           return SizedBox(
//             width: 120,
//             height: 120,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(15.0)),
//               child: Image.asset(
//                 'assets/images/app_logo.png',
//               ),
//             ),
//           );
//         },
//
//         // width: screenWidth.width,
//       ),
//     ),
//   );
// }
