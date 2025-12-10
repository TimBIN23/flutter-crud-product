# users

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flutter CRUD Product Application

This is a **Flutter frontend** application for managing products using a **CRUD (Create, Read, Update, Delete)** interface.  
It connects to an **ASP.NET Core API** for storing and retrieving product data.  

---

## Table of Contents

- [Features](#features)  
- [Technologies](#technologies)  
- [Getting Started](#getting-started)  
- [Project Structure](#project-structure)  
- [API Integration](#api-integration)  
- [Usage](#usage)  
- [License](#license)  

---

## Features

- List all products with latest products on top  
- Create a new product with form validation  
- Edit existing product  
- Delete product with confirmation  
- Automatic refresh of product list after any operation  
- Works on **Android, iOS, and Web**  
- Handles different API URLs for emulator, physical devices, and web  

---

## Technologies

- Flutter 3+  
- Dart  
- HTTP package (`http`) for API requests  
- FutureBuilder and StatefulWidget for UI updates  
- Navigator for page routing (create/edit forms)  

---

## Getting Started

### Prerequisites

- Flutter SDK installed: [Flutter Install](https://flutter.dev/docs/get-started/install)  
- Android Studio or VS Code  
- ASP.NET Core API running (backend project)  

### Run the Project

1. Clone the repository:

```bash
git clone git@github.com:TimBIN23/flutter-crud-product.git
cd flutter-crud-product
