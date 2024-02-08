import 'package:block_state_management/bloc/switch/switch_bloc.dart';
import 'package:block_state_management/bloc/switch/switch_event.dart';
import 'package:block_state_management/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Switch Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Notifications'),
                    BlocBuilder<SwitchBloc, SwitchStates>(
                      buildWhen: (previous,current)=>previous.isSwitch != current.isSwitch,
                        builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            print(newValue);
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDisableNotifications());
                          });
                    })
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                    builder: (context, state) {
                  return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
                }),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                    builder: (context, state) {
                  return Slider(value: state.slider, onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });
                })
              ]),
        ));
  }
}
