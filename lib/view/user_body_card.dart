// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBodyCard extends StatelessWidget {
  final user;
  const UserBodyCard({Key? key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final doj = DateTime(
        int.tryParse(user.dateOfJoining.split('-')[0])!,
        int.tryParse(user.dateOfJoining.split('-')[1])!,
        int.tryParse(user.dateOfJoining.split('-')[2])!);
    final today = DateTime.now();
    final difference = (today.difference(doj).inDays / 365).floor();
    bool isLongTermUser = user.status == 'active' && difference >= 5;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: isLongTermUser ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(20)),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: 'User\'s name : ',
                      style: GoogleFonts.inter(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.045,
                      ),
                      children: [
                    TextSpan(
                        text: user.name,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.035,
                        ))
                  ])),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: 'User\'s email : ',
                      style: GoogleFonts.inter(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.045,
                      ),
                      children: [
                    TextSpan(
                        text: user.email,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.035,
                        ))
                  ])),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: 'Status : ',
                      style: GoogleFonts.inter(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.045,
                      ),
                      children: [
                    TextSpan(
                        text:
                            "${user.status[0].toUpperCase()}${user.status.substring(1).toLowerCase()}",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.04,
                        ))
                  ])),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: 'Date of Joining : ',
                      style: GoogleFonts.inter(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.045,
                      ),
                      children: [
                    TextSpan(
                        text: user.dateOfJoining,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.035,
                        ))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
