import 'package:to_do_list/index.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  void initState() {
    context.read<HomeBloc>().add(FetchDataTask());
    _controller.text = "";
    context.read<HomeBloc>().add(FetchDataTaskOfDayEvent(
        date: "${DateFormat.yMMMd().format(DateTime.now())}"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      context.read<HomeBloc>().add(FetchDataTaskOfDayEvent(
          date: "${DateFormat.yMMMd().format(DateTime.now())}"));
      _controller.text = "";
    });
    return Scaffold(
      appBar: AppbarHomeSearchAllAddTask(
        canBack: false,
        title: 'Home',
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarComponent(
              index: 1,
              controller: _controller,
              onChange: () {},
              keySearch: _controller.text,
              placeholder: 'Search for Tasks, Events',
            ),
            ItemDateCreateNewTask(
              date: 'Today',
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  return Text(state.message.toString());
                case PostStatus.success:
                  {
                    if (state.listTodayTasks.length == 0) {
                      return Center(child: Text("No tasks available"));
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.listTodayTasks.length,
                            itemBuilder: (context, index) {
                              return ItemTask(
                                  task: state.listTodayTasks[index]);
                            }),
                      );
                    }
                  }
                  ;
              }
            })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorBarTodolist(
        initIndex: 0,
      ),
    );
  }
}
