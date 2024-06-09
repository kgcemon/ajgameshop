import 'package:flutter/material.dart';

class PaymetMethodePicker extends StatefulWidget {
  const PaymetMethodePicker(
      {super.key,
      required this.listOfPaymetsMethods,
      required this.onChange,
      this.isRounded = false,
      required this.images});

  final List<String> listOfPaymetsMethods;
  final Function(String) onChange;
  final bool isRounded;
  final List<String> images;

  @override
  State<PaymetMethodePicker> createState() => _PaymetMethodePickerState();
}

class _PaymetMethodePickerState extends State<PaymetMethodePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listOfPaymetsMethods.length,
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    widget.onChange(widget.listOfPaymetsMethods[index]);
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 56,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            _getSelectedBackgroundColor(index == selectedIndex),
                        borderRadius: BorderRadius.circular(10)),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            widget.images[index],
                            width: 26,
                          ),
                          Text(
                            widget.listOfPaymetsMethods[index].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          }),
    );
  }

  Color _getSelectedTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _getSelectedBackgroundColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.transparent;
  }
}
