import 'package:app_struc/core/router/app_router.dart';
import 'package:app_struc/data/network/dto/conversation/conversation_dto.dart';
import 'package:app_struc/data/repositories/user_repository.dart';
import 'package:app_struc/modules/conversation/cubit/conversation_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late final ConversationCubit _conversationCubit;
  List<String> drawerItems = [];
  List<Widget> drawerOptions = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    _conversationCubit = ConversationCubit(UserRepository());
    _conversationCubit.isUserLogin().then((isLogin) =>
    {
      if (!isLogin)
        {
          Navigator.of(context)
              .pushReplacementNamed(AppRouter.choose_server)
        }
      else
        {_conversationCubit.getUserWorkspaces()}
    });
    super.initState();
  }

  _getDrawerItemScreen(int pos) {
    //  return new FirstScreen(drawerItem: drawerItems[_selectedIndex]);
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
      _getDrawerItemScreen(_selectedIndex);
    });
    Navigator.of(context).pop(); // close the drawer
//    Navigator.push(
//      context,
//      new MaterialPageRoute(
//        builder: (context) => _getDrawerItemScreen(_selectedIndex),
//      ),
//    );
  }

  setWorkspaces() {
    for (var i = 0; i < drawerItems.length; i++) {
      var workspaceName = drawerItems[i];
      drawerOptions.add(new ListTile(
        title: new Text(
          workspaceName,
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        selected: i == _selectedIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    setWorkspaces();
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text(
                  "emamagic",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                accountEmail: Text('')),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemScreen(_selectedIndex),
    );
  }

  @override
  void dispose() {
    _conversationCubit.dispose();
    super.dispose();
  }
}

class ConversationListView extends StatefulWidget {
  @override
  _ConversationListViewState createState() => _ConversationListViewState();
}

class _ConversationListViewState extends State<ConversationListView> {
  static const _pageSize = 20;

  final PagingController<int, ConversationDto> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    // try {
    //   final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
    //   final isLastPage = newItems.length < _pageSize;
    //   if (isLastPage) {
    //     _pagingController.appendLastPage(newItems);
    //   } else {
    //     final nextPageKey = pageKey + newItems.length;
    //     _pagingController.appendPage(newItems, nextPageKey);
    //   }
    // } catch (error) {
    //   _pagingController.error = error;
    // }
  }

  @override
  Widget build(BuildContext context) =>
      PagedListView<int, ConversationDto>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<ConversationDto>(
          itemBuilder: (context, item, index) => CharacterListItem(
            conversation: item,
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    required this.conversation,
    Key? key,
  }) : super(key: key);

  final ConversationDto conversation;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: CircleAvatar(
      radius: 20,
    ),
    title: Text(conversation.displayName!),
  );
}