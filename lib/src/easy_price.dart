import 'package:flutter/widgets.dart';

class EasyPrice extends StatefulWidget {
  final int price;
  final String currencyType;
  final TextStyle textStyle;
  final int precision;
  const EasyPrice(
      {super.key,
      required this.price,
      this.currencyType = 'usd',
      this.textStyle = const TextStyle(),
      this.precision = 2});

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
    return Text(
      price.toString(),
      style: widget.textStyle,
    );
  }

  _sortPricing({required int price, String currencyType = 'usd'}) {
    String priceAsString = price.toString();

    String currentSymbol = _currencySymbol(currencyType: currencyType);

    int priceLength = priceAsString.length;

    if (priceLength >= 6 && priceLength < 8) {
      double priceInLacs = price / 100000;
      String formattedPrice = priceInLacs.toStringAsFixed(widget.precision);
      return '$currentSymbol $formattedPrice Lacs';
    } else if (priceLength >= 8) {
      double priceInLacs = price / 100000;
      String formattedPrice = priceInLacs.toStringAsFixed(widget.precision);
      return '$currentSymbol $formattedPrice Crores';
    } else {
      return priceAsString;
    }
  }

  _currencySymbol({String currencyType = ''}) {
    String currentSymbol = '';
    switch (currencyType.toLowerCase()) {
      case 'inr':
        currentSymbol = '₹';
      case 'eur':
        currentSymbol = '€';
        break;
      case 'usd':
        currentSymbol = "\$";
        break;
      default:
        currentSymbol = "\$";
    }
    return currentSymbol;
  }
}