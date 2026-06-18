import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weekly/features/event/bindings/event_binding.dart';

class EventView extends GetView<EventBinding> {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Column(children: [])),
    );
  }
}
