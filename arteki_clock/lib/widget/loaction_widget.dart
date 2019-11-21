import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/location_state.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<LocationState>(
        builder: _locationBuilder,
      );

  Widget _locationBuilder(BuildContext context, LocationState state, _) => Text(
        state.location ?? '',
        textAlign: TextAlign.center,
      );
}
