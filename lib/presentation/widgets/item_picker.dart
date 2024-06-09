import 'package:flutter/material.dart';

import '../../data/models/product_models.dart';
import '../utility/app_colors.dart';

class ItemPicker extends StatefulWidget {
  const ItemPicker({
    super.key,
    required this.onChange,
    required this.products,
  });

  final Function(Products) onChange;
  final List<Products> products;

  @override
  State<ItemPicker> createState() => _ItemPickerState();
}

class _ItemPickerState extends State<ItemPicker> {
  int ?selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 2,
        childAspectRatio: 9/ 4,
        mainAxisExtent: 60
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onChange(widget.products[index] );
          },
          child: Stack(
            children: [
              Card(
                elevation: 10,
                shadowColor: AppColors.primaryColor,
                child: Container(
                  margin: const EdgeInsets.only(right: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? AppColors.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: FittedBox(
                    child: Text(
                      '${widget.products[index].name}',
                      style:  TextStyle(
                        color: selectedIndex == index ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '${widget.products[index].price}৳',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
