import 'dart:io';

void main() {
  InventorySystem obj = InventorySystem();

  while (true) {
    print(" INVENTORY MANAGEMENT SYSTEM ");
    print('1. Add Item');
    print('2. List Items');
    print('3. Update Item');
    print('4. Delete Item');
    print('5. Exit');

    stdout.write('Enter your section: ');
    String? section = stdin.readLineSync();

    switch (section) {
      case '1':
        obj.addItem();
        break;
      case '2':
        obj.listItems();
        break;
      case '3':
        obj.updateItem();
        break;
      case '4':
        obj.deleteItem();
        break;
      case '5':
        print('Exiting...');
        exit(0);
      default:
        print('Invalid section. Please enter the valid section.');
    }
  }
}

class InventorySystem {
  List<Item> items = [];

  void addItem() {
    print('Enter the item Name:');
    String name = stdin.readLineSync()!;
    print('Enter the item ID:');
    String id = stdin.readLineSync()!;
    print('Enter the item Quantity:');
    String quantity = stdin.readLineSync()!;
    print('Enter the item Price:');
    String price = stdin.readLineSync()!;
    print('Enter the item Description:');
    String description = stdin.readLineSync()!;

    Item item = Item(
        id: id,
        name: name,
        quantity: quantity,
        price: price,
        description: description);
    items.add(item);
    print('Item added successfully.');
  }

  void listItems() {
    if (items.isEmpty) {
      print('No items found.');
    } else {
      for (var item in items) {
        print(item);
      }
    }
  }

  void updateItem() {
    print('Enter the item ID to update:');
    String? updateId = stdin.readLineSync();
    if (updateId == null || updateId.isEmpty) {
      print('Invalid ID.');
      return;
    }

    Item? item = items.firstWhere(
      (itm) => itm.id == updateId,
      orElse: () =>
          Item(id: '', name: '', quantity: '', price: '', description: ''),
    );

    if (item.id == '') {
      print('Item not found.');
      return;
    }

    print('Updating Item: ${item.name}');
    print('Enter new name:');
    String? name = stdin.readLineSync();
    if (name != null && name.isNotEmpty) item.name = name;

    print('Enter new quantity:');
    String? quantity = stdin.readLineSync();
    if (quantity != null && quantity.isNotEmpty) item.quantity = quantity;

    print('Enter new price:');
    String? price = stdin.readLineSync();
    if (price != null && price.isNotEmpty) item.price = price;

    print('Enter new description:');
    String? description = stdin.readLineSync();
    if (description != null && description.isNotEmpty)
      item.description = description;

    print('Item updated successfully.');
  }

  void deleteItem() {
    print('Enter the item ID to delete:');
    String? deleteId = stdin.readLineSync();
    if (deleteId == null || deleteId.isEmpty) {
      print('Invalid ID.');
      return;
    }

    items.removeWhere((itm) => itm.id == deleteId);
    print('Item deleted successfully.');
  }
}

class Item {
  String id;
  String name;
  String quantity;
  String price;
  String description;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
  });

  @override
  String toString() {
    return 'Item{id: $id, name: $name, quantity: $quantity, price: $price, description: $description}';
  }
}
