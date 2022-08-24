import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_nija_application/app/change_notifies/cart_provider.dart';
import 'package:food_nija_application/app/change_notifies/foods_provider.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/data/models/cart.dart';
import 'package:food_nija_application/data/models/cart_model.dart';
import 'package:provider/provider.dart';

class OrderFoodCard extends StatefulWidget {
  final int q;
  const OrderFoodCard({Key? key, required this.q}) : super(key: key);
  @override
  State<OrderFoodCard> createState() => _OrderFoodCardState();
}

class _OrderFoodCardState extends State<OrderFoodCard> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = widget.q.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final foodsProvider = Provider.of<FoodsProvider>(context);
    final cartModel = Provider.of<CartModel>(context);
    final getCurrfood = foodsProvider.findProdById(cartModel.productId);
    final cartProvider = Provider.of<CartProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 3,
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) async => {
                    await cartProvider.removeOneItem(
                      cartId: cartModel.id,
                      productId: cartModel.productId,
                      quantity: cartModel.quantity,
                    ),
                  }),
              backgroundColor: AppColors.priceTextColor,
              foregroundColor: Color.fromARGB(255, 92, 56, 56),
              icon: Icons.delete,
              spacing: 2,
              borderRadius: BorderRadius.circular(22),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getHeight(10)),
          child: ListTile(
            leading: Image.network(
              getCurrfood.imageURL,
              width: getWidth(65),
              height: getWidth(65),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCurrfood.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getFont(16),
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  getCurrfood.resName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getFont(15),
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            subtitle: Text(
              '\$ ${getCurrfood.price}',
              style: TextStyle(
                fontSize: getFont(17),
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: SizedBox(
              width: getWidth(110),
              child: Row(
                children: [
                  _quantityController(
                    fct: () {
                      if (_quantityTextController.text == '1') {
                        return;
                      } else {
                        cartProvider.reduceQuantityByOne(cartModel.productId);
                        setState(() {
                          _quantityTextController.text =
                              (int.parse(_quantityTextController.text) - 1)
                                  .toString();
                        });
                      }
                    },
                    color: Colors.red,
                    icon: Icons.remove,
                    isLeft: true,
                  ),
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: _quantityTextController,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9]'),
                        ),
                      ],
                      onChanged: (v) {
                        setState(() {
                          if (v.isEmpty) {
                            _quantityTextController.text = '1';
                          } else {
                            return;
                          }
                        });
                      },
                    ),
                  ),
                  _quantityController(
                    fct: () {
                      cartProvider.increaseQuantityByOne(cartModel.productId);
                      setState(() {
                        _quantityTextController.text =
                            (int.parse(_quantityTextController.text) + 1)
                                .toString();
                      });
                    },
                    color: Colors.red,
                    icon: Icons.add,
                    isLeft: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _quantityController({
    required Function fct,
    required IconData icon,
    required Color color,
    required bool isLeft,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: isLeft
              ? AppColors.primaryColor.withOpacity(0.1)
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color:
                    isLeft ? AppColors.primaryColor : AppColors.itemChildColor,
                size: getWidth(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
