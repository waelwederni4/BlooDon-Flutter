import 'package:bloodon/Views/views/sliding_card.dart';
import 'package:flutter/material.dart';
import 'AppointmentBackCard.dart';
import 'AppointmentFrontCard.dart';
import 'package:bloodon/Controleurs/utils/sizeConfig.dart';
class AppointmentCard extends StatefulWidget {
  const AppointmentCard({
    Key key,
    this.slidingCardController,
  }) : super(key: key);

  final  SlidingCardController slidingCardController;

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SlidingCard(
        slimeCardElevation: 0.5,
        // slidingAnimationReverseCurve: Curves.bounceInOut,
        cardsGap: SizeConfig.safeBlockVertical,
        controller: widget.slidingCardController,
        slidingCardWidth: SizeConfig.horizontalBloc * 90,
        visibleCardHeight: SizeConfig.safeBlockVertical * 27,
        hiddenCardHeight: SizeConfig.safeBlockVertical * 15,
        frontCardWidget: AppointmentFrontCard(
          address: 'Route El Ain Km 0,5-Sfax',
          name: 'Hopitale Habib Bourgiba',
          campagneDate: '12 Jan 2020 ',
          campagneTime: '12Am',
          onInfoTapped: () {
            print('info pressed');
            widget.slidingCardController.expandCard();
          },
          onRedCloseButtonTapped: (){
            widget.slidingCardController.collapseCard();
          },
        ),
        backCardWidget:AppointmentBackCard(
            onPhoneTapped: (){print('Phone tapped');},
            patientComment: "L'hôpital Habib Bourguiba organise une campagne de dons"
        ),
      ),
    );
  }
}