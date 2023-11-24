import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polytech_visits/pages/auth/bloc/auth_bloc.dart';
import 'package:polytech_visits/pages/home/bloc/home_bloc.dart';
import 'package:polytech_visits/utils/styles/color_palette.dart';
import 'package:polytech_visits/utils/styles/styles.dart';
import 'package:polytech_visits/widgets/qr_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: ColorPalette.main,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(EventAuthLogout());
                          },
                          child: const Icon(
                            Icons.exit_to_app,
                            size: 28,
                            color: ColorPalette.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 50),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoadedState) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: CircleAvatar(
                                    backgroundColor: ColorPalette.main,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: state.user.avatar ??
                                              'https://mtek3d.com/wp-content/uploads/2018/01/image-placeholder-500x500.jpg',
                                          placeholder: (context, url) =>
                                              Container(
                                            color: ColorPalette.lightGrey,
                                            width: 120,
                                            height: 120,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                    '${state.user.firstName} ${state.user.lastName}',
                                    style: ProjectStyles.textStyle_18Bold),
                                const SizedBox(height: 10),
                                Text(state.user.email ?? '',
                                    style: ProjectStyles.textStyle_14Regular
                                        .copyWith(color: ColorPalette.gray)),
                              ],
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: CircleAvatar(
                                  backgroundColor: ColorPalette.main,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://mtek3d.com/wp-content/uploads/2018/01/image-placeholder-500x500.jpg',
                                        placeholder: (context, url) =>
                                            Container(
                                          color: ColorPalette.lightGrey,
                                          width: 120,
                                          height: 120,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text('User',
                                  style: ProjectStyles.textStyle_18Bold),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: ProjectStyles.containerDecoration,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: const [
                            Icon(Icons.account_circle),
                            SizedBox(width: 10),
                            Text(
                              'Личная информация',
                              style: ProjectStyles.textStyle_14Medium,
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: ProjectStyles.containerDecoration,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: const [
                            Icon(Icons.lock),
                            SizedBox(width: 10),
                            Text(
                              'Настройки входа',
                              style: ProjectStyles.textStyle_14Medium,
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRViewPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: ProjectStyles.containerDecoration
                            .copyWith(color: ColorPalette.main),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.qr_code_scanner,
                                color: ColorPalette.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Сканировать QR',
                                style: ProjectStyles.textStyle_14Medium
                                    .copyWith(color: ColorPalette.white),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: ColorPalette.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // const Spacer(),
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
