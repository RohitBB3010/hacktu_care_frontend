import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktu_care_frontend/sos-alarm/sos_cubit.dart';

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SOSCubit, bool>(
      builder: (context, isAlertActive) {
        return Scaffold(
          appBar: AppBar(title: Text('SOS Alert System')),
          body: Center(
            child: isAlertActive
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SOS Alert Active!',
                          style: TextStyle(fontSize: 24, color: Colors.red)),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => context.read<SOSCubit>().stopSOS(),
                        child: Text('STOP SOS'),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () => context
                        .read<SOSCubit>()
                        .sendSOS('guardian_fcm_token_here'),
                    child: Text('Send SOS'),
                  ),
          ),
        );
      },
    );
  }
}
