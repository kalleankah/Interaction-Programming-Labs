import 'package:credit_card_flutter/credit_card_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:credit_card_flutter/credit_card_formatter.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          transform: Matrix4.translationValues(0, 110, 0),
          margin: const EdgeInsets.only(bottom: 115),
          padding: const EdgeInsets.only(top: 115, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black45, blurRadius: 24),
              ]),
          child: const CreditCardForm()),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: const CreditCardView()),
    ]);
  }
}

class DecoratedInputContainer extends StatelessWidget {
  const DecoratedInputContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}

class CreditCardView extends StatelessWidget {
  const CreditCardView({Key? key}) : super(key: key);

  final TextStyle textStyleNumber = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 4.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  final TextStyle textStyleCard = const TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 4.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  final TextStyle textStyleHeader = const TextStyle(
    color: Color(0xFF909090),
    fontSize: 11,
    fontWeight: FontWeight.w700,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 4.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 203,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black45, blurRadius: 10),
            ]),
        child: AspectRatio(
            aspectRatio: 675 / 435,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: Provider.of<CreditCardModel>(context, listen: false)
                      .randomizeBackground,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Consumer<CreditCardModel>(
                          builder: (context, card, child) {
                        return card.background;
                      })),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/chip.png'),
                            Consumer<CreditCardModel>(
                                builder: (context, card, child) {
                              return card.logo;
                            }),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Consumer<CreditCardModel>(
                            builder: (context, card, child) {
                          return Text(
                            card.number,
                            style: textStyleNumber,
                          );
                        }),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 10,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Card Holder', style: textStyleHeader),
                                    Consumer<CreditCardModel>(
                                        builder: (context, card, child) {
                                      return Text(
                                        card.name,
                                        style: textStyleCard,
                                        overflow: TextOverflow.ellipsis,
                                      );
                                    }),
                                  ]),
                            ),
                            Flexible(
                              flex: 4,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Expires', style: textStyleHeader),
                                    Consumer<CreditCardModel>(
                                        builder: (context, card, child) {
                                          String mm = card.month ?? "MM";
                                          String yy = card.year ?? "YY";
                                          return Text(
                                            mm + "/" + yy,
                                            style: textStyleCard,
                                          );
                                        }),
                                  ]),
                            ),
                            Flexible(
                              flex: 4,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('CVV', style: textStyleHeader),
                                    Consumer<CreditCardModel>(
                                        builder: (context, card, child) {
                                      return Text(
                                        card.cvv,
                                        style: textStyleCard,
                                      );
                                    }),
                                  ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class CreditCardForm extends StatelessWidget {
  const CreditCardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Consumer<CreditCardModel>(builder: (context, card, child) {
                return TextFormField(
                  onChanged: (newVal) => card.setNumber(newVal),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
                    CreditCardFormatter(mask: card.mask),
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Card Number'),
                );
              }),
              const SizedBox(height: 16),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Z]')),
                  LengthLimitingTextInputFormatter(24)
                ],
                onChanged: (newVal) =>
                    Provider.of<CreditCardModel>(context, listen: false)
                        .setName(newVal.toUpperCase()),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: 'Card Holder'),
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: Consumer<CreditCardModel>(
                      builder: (context, card, child) {
                    return DecoratedInputContainer(
                      child: DropdownButton<String>(
                        // This line avoids focus returning to text fields after selecting an item. It's a flutter bug
                        onTap: () => FocusScope.of(context).unfocus(),
                        value: card.month,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Month"),
                        items: <String>["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newVal) => card.setMonth(newVal),
                      ),
                    );
                  }),
                ),
                const Spacer(flex: 1),
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: DecoratedInputContainer(
                    child: Consumer<CreditCardModel>(
                        builder: (context, card, child) {
                      return DropdownButton<String>(
                        value: card.year,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Year"),
                        items: <String>[
                          "28",
                          "27",
                          "26",
                          "25",
                          "24",
                          "23",
                          "22",
                          "21",
                          "20"
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newVal) => card.setYear(newVal),
                      );
                    }),
                  ),
                ),
                const Spacer(flex: 2),
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: Consumer<CreditCardModel>(
                      builder: (context, card, child) {
                    return TextFormField(
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(card.cvvMask.length)
                      ],
                      onChanged: (newVal) => card.setCvv(newVal),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          labelText: 'CVV'),
                    );
                  }),
                )
              ]),
              const SizedBox(height: 16),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xFF0055D4)),
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]));
  }
}
