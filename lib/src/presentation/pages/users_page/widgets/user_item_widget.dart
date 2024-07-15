import 'package:flutter/material.dart';
import '../../../../core/constants/my_asset.dart';
import 'package:flutter_new_project/src/domain/entities/user_entity.dart';

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 124,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _ItemPhoto(user: user),
              _ItemDescription(user: user),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemPhoto extends StatelessWidget {
  const _ItemPhoto({
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: SizedBox(
        height: 122,
        child: Hero(
            tag: user.id!,
            child: FadeInImage(
              width: 122,
              fit: BoxFit.fill,
              image: user.image == null || user.image == ""
                  ? const AssetImage(MyAsset.flutterLogo3x) as ImageProvider
                  : NetworkImage(
                      user.image!,
                      // height: 150,
                      // width: double.infinity,
                      // fit: BoxFit.scaleDown,
                    ),
              placeholder: const AssetImage(MyAsset.flutterLogo3x),
            )),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: colorScheme.surfaceVariant,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Gender: ${user.gender}',
                  style: textTheme.labelSmall!.copyWith(),
                ),
                const SizedBox(height: 4),
                Text(
                  'Email: ${user.email ?? ''}',
                  style: textTheme.labelSmall!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
