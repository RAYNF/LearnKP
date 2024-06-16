import 'package:flutter/material.dart';
import 'package:pantau_semar/data/api/api_service.dart';
import 'package:pantau_semar/data/model/getberita_model.dart';
import 'package:pantau_semar/data/model/registerresponse_model.dart';
import 'package:pantau_semar/data/model/user_model.dart';
import 'package:pantau_semar/ui/beranda_page.dart';
import 'package:pantau_semar/utils/Theme.dart';

class DetailNews extends StatefulWidget {
  static const routeName = '/detail-news';
  final Berita berita;
  final Data dataUser;

  const DetailNews({super.key, required this.berita, required this.dataUser});

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  late Future<RegisterResponseModel> _deleteBerita;
  late RegisterResponseModel _deleteResponse;
  late Future<RegisterResponseModel> _updateBerita;
  late RegisterResponseModel _updateResponse;

  final TextEditingController _users_id = TextEditingController();
  final TextEditingController _judul = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _urlImage = TextEditingController();

  void dispose() {
    super.dispose();
    _judul.dispose();
    _description.dispose();
    _urlImage.dispose();
  }

  @override
  void initState() {
    super.initState();
    _users_id.text = widget.dataUser.id;
    _judul.text = widget.berita.judul;
    _description.text = widget.berita.description;
    _urlImage.text = widget.berita.urlImage;
  }

  void _removeBerita(String idBerita) {
    _deleteBerita = ApiService().removeBerita(idBerita);
    _deleteBerita.then((value) {
      _deleteResponse = value;
      if (_deleteResponse.succes == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("hapus Berita berhasil"),
              content: Text(_deleteResponse.message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Beranda(
                        dataUser: widget.dataUser,
                      );
                    }));
                  },
                  child: Text("Beranda"),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("hapus Berita  Gagal"),
              content: Text("Ulangi register kembali"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(error.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }

  void _editBerita() {
    _updateBerita = ApiService().UpdateBerita(_users_id.text, _judul.text,
        _description.text, _urlImage.text, widget.berita.id);
    _updateBerita.then((value) {
      _updateResponse = value;
      if (_updateResponse.succes == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("edit berita berhasil"),
              content: Text(_updateResponse.message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Beranda(
                        dataUser: widget.dataUser,
                      );
                    }));
                  },
                  child: Text("Kembali"),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("edit berita Gagal"),
              content: Text(_updateResponse.message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(error.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool _isVisible = widget.dataUser.level == "admin";

    return Scaffold(
      backgroundColor: danger,
      appBar: AppBar(
          backgroundColor: danger,
          centerTitle: true,
          title: Text("Bantuan", style: heading.copyWith(color: primary)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: primary,
          )),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: screenSize.height / 1.16,
            width: screenSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: primary),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.berita.judul,
                    textAlign: TextAlign.center,
                    style: subHeading.copyWith(color: danger),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: screenSize.height / 3,
                    child: Image.network(widget.berita.urlImage),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.berita.tanggal.toString(),
                    style: textSm.copyWith(color: danger),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.berita.description,
                    style: text.copyWith(color: danger),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.berita.usersId,
                        style: textSm.copyWith(color: danger),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: _isVisible,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Update berita'),
                                  content: Container(
                                    width: screenSize.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextField(
                                          controller: _users_id,
                                          readOnly: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                              hintText: 'user id'),
                                        ),
                                        TextField(
                                          controller: _judul,
                                          decoration: InputDecoration(
                                              hintText: 'judul berita'),
                                        ),
                                        TextField(
                                          controller: _description,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            hintText: 'deskripsi',
                                          ),
                                        ),
                                        TextField(
                                          controller: _urlImage,
                                          decoration: InputDecoration(
                                              hintText: 'link image'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Batal'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Upload'),
                                      onPressed: () {
                                        _editBerita();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text("Edit Berita"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Visibility(
                        visible: _isVisible,
                        child: ElevatedButton(
                          onPressed: () {
                            _removeBerita(widget.berita.id);
                          },
                          child: Text("Hapus Berita"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
