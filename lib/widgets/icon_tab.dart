import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/widgets/icon_widget.dart';

class IconTab extends StatelessWidget {
  const IconTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWidget(title: "Forest", color: forestColor, icon: Icons.map),
        Spacer(),
        IconWidget(title: "Camping", color: campingColor, icon: Icons.fireplace),
        Spacer(),
        IconWidget(title: "Boat Trip", color: boatColor, icon: Icons.houseboat),
        Spacer(),
        IconWidget(title: "Hiking", color:hikingColor , icon: Icons.hiking),
        Spacer(),
        IconWidget(title: "World Tour", color: WorldtourColor, icon: Icons.tour),
        
      ],
    );
  }
}
