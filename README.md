# alpha_twelve_store

# 🛒Alpha Twelve Store – eCommerce Preview App

A three-screen mobile shopping app built with Flutter using MVVM architecture and Provider state management. This app was developed as part of a Mobile App Developer Task and matches the provided Figma design precisely.

## 📱 Features

- Browse a grid of products (Home screen)
- View detailed product information (Product Details)
- Add products to the cart
- Manage cart with quantity updates and delete (Cart Screen)
- View order summary with subtotal, shipping, and total (Cart Screen)
- Toast notification on add-to-cart
- Clean UI based on Figma design

---

## 🧱 Tech Stack

- **Flutter**
- **Provider** for state management
- **MVVM architecture**
- **Dart**
- **Fluttertoast** for toast messages
- No backend — uses mock local JSON/static product list

---

## 📂 Project Structure

lib/
├── main.dart
├── app/ # App entry & route setup
├── core/ # Models and utils
│ └── models/ # Product model
├── data/ # Static/mock product data
├── view/ # Screens & widgets (UI)
│ ├── screens/ # Home, Product Detail, Cart
│ └── widgets/ # Reusable UI components
├── viewmodel/ # ViewModels for Product and Cart


---

## 🧪 How to Run the Project

### 1. Clone the Repository
```bash
[git clone https://github.com/Zackcodder/alpha_twelve_store.git]
cd alpha_twelve_store
flutter pub get
flutter run
flutter build apk --release
