import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String? hint;
  final String? iconPath;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;
  final Color? backgroundColor;
  final Color? dropdownColor;
  final double? width;

  const CustomDropDown({
    super.key,
    required this.items,
    this.value,
    required this.onChanged,
    this.hint,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.dropdownColor = const Color(0xFFFFFFFF),
    this.iconPath,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButtonHideUnderline(
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: dropdownColor),
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              hint: Text(
                hint ?? '',
                style: const TextStyle(color: Color(0xFF000000), fontSize: 14),
              ),
              icon:
                  iconPath != null
                      ? Image.asset(iconPath!, width: 24, height: 24)
                      : const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
              dropdownColor: dropdownColor,
              borderRadius: BorderRadius.circular(8),
              items:
                  items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),

              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
