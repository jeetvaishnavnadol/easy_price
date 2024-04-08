import 'package:flutter/widgets.dart';

class EasyPrice extends StatefulWidget {
  final int price;
  final String currencyType;
  final TextStyle textStyle;
  final TextStyle currencyStyle;
  final int precision;

  const EasyPrice(
      {super.key,
      required this.price,
      this.currencyType = 'usd',
      this.textStyle = const TextStyle(),
      this.precision = 2,
      this.currencyStyle = const TextStyle()});

  @override
  State<EasyPrice> createState() => _EasyPriceState();
}

class _EasyPriceState extends State<EasyPrice> {
  String price = '';
  @override
  void initState() {
    price =
        _sortPricing(price: widget.price, currencyType: widget.currencyType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _currencySymbol(
            currencyType: widget.currencyType,
          ),
          style: widget.currencyStyle,
        ),
        Text(
          price.toString(),
          style: widget.textStyle,
        ),
      ],
    );
  }

  _sortPricing({required int price, String currencyType = 'usd'}) {
    String priceAsString = price.toString();

    int priceLength = priceAsString.length;

    if (priceLength >= 6 && priceLength < 8) {
      double priceInLacs = price / 100000;
      String formattedPrice = priceInLacs.toStringAsFixed(widget.precision);
      return ' $formattedPrice ${currencyType.toLowerCase() == 'inr' ? 'Lacs' : 'Thousand'}';
    } else if (priceLength >= 8) {
      double priceInLacs = price / 100000;
      String formattedPrice = priceInLacs.toStringAsFixed(widget.precision);
      return ' $formattedPrice ${currencyType.toLowerCase() == 'inr' ? 'Crores' : 'Million'}';
    } else {
      return priceAsString;
    }
  }

  _currencySymbol({String currencyType = ''}) {
    String currencySymbol = '';
    switch (currencyType.toLowerCase()) {
      case 'inr':
        currencySymbol = '₹';
      case 'eur':
        currencySymbol = '€';
        break;
      case 'usd':
        currencySymbol = "\$";
        break;
      default:
        currencySymbol = "\$";
    }
    return currencySymbol;
  }
}
