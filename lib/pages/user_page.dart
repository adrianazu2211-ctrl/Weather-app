import 'package:flutter/material.dart';
import 'package:weatherapp/models/user_model.dart';
import 'package:weatherapp/services/user_mockapi_service.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> userList = [];

  UserMockapiService userMockapiService = UserMockapiService();
  bool _isLoading = false;

  Future<void> getUsers() async {
    _isLoading = true;
    setState(() {});
    userList = await userMockapiService.getUsers();
    _isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          UserModel _usuarioNuevo = UserModel(
            createdAt: DateTime.now(),
            name: "Jhonny Gallegos",
            avatar:
                "https://images.pexels.com/photos/8128187/pexels-photo-8128187.jpeg",
          );

          await userMockapiService.createUser(_usuarioNuevo);

          await getUsers();
        },
      ),
      appBar: AppBar(title: Text("Usuarios")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : userList.isEmpty
          ? Center(child: Text("NO hay ningun usuario registrado"))
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(userList[index].name),
                    subtitle: Text(userList[index].createdAt.toString()),
                    leading: Image.network(
                      userList[index].avatar,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            UserModel updateUser = UserModel(
                              createdAt: DateTime.now(),
                              name: "Juana Cervantes",
                              avatar:
                                  "https://images.pexels.com/photos/36512355/pexels-photo-36512355.jpeg",
                              id: userList[index].id,
                            );
                            await userMockapiService.updateUser(updateUser);
                            await getUsers();
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await userMockapiService.deleteUser(
                              userList[index].id.toString(),
                            );
                            await getUsers();
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
