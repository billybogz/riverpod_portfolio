import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum UpdateViewType { success, fail }

class UpdateView extends StatelessWidget {
  final String responseMessage;
  final void Function() onPressed;
  final UpdateViewType updateViewType;
  final String? buttonText;
  final String? title;
  final Widget? icon;
  final bool hasButton;

  const UpdateView.success({
    Key? key,
    required this.responseMessage,
    required this.onPressed,
    this.buttonText,
    this.icon,
    this.hasButton = true,
    this.title,
  })  : updateViewType = UpdateViewType.success,
        super(key: key);

  const UpdateView.fail({
    Key? key,
    required this.responseMessage,
    required this.onPressed,
    this.buttonText,
    this.icon,
    this.hasButton = true,
    this.title,
  })  : updateViewType = UpdateViewType.fail,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 500.0,
        height: 450.0,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _ImageView(
              updateViewType: updateViewType,
              icon: icon,
            ),
            const SizedBox(height: 57),
            _HeaderView(
              updateViewType: updateViewType,
              title: title,
            ),
            const SizedBox(height: 16),
            _MessageView(
              responseMessage: responseMessage,
            ),
          ],
        ),
      );
}

class _ImageView extends StatelessWidget {
  const _ImageView({
    required this.updateViewType,
    required this.icon,
  });

  final UpdateViewType updateViewType;
  final Widget? icon;

  @override
  Widget build(BuildContext context) => Align(
        child: SizedBox(
          width: double.infinity,
          child: icon ??
              Icon(
                updateViewType == UpdateViewType.success
                    ? MdiIcons.checkCircle
                    : MdiIcons.alertCircle,
                size: 120.0,
                color: updateViewType == UpdateViewType.success
                    ? Color(0xFF00CE89)
                    : Color(0xFFBA495A),
              ),
        ),
      );
}

class _HeaderView extends StatelessWidget {
  const _HeaderView({
    required this.updateViewType,
    required this.title,
  });

  final UpdateViewType updateViewType;
  final String? title;

  @override
  Widget build(BuildContext context) => Text(
        title ??
            (updateViewType == UpdateViewType.success ? 'sdfd' : 'asdfsdf'),
        //     ? sSuccess : sFailed,
        style: Theme.of(context).textTheme.displayLarge,
      );
}

class _MessageView extends StatelessWidget {
  const _MessageView({required this.responseMessage});

  final String responseMessage;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 310,
        child: Text(
          responseMessage,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      );
}
