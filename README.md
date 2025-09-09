# Personal Expenses Tracker Flutter App

A modern Flutter application for tracking personal expenses and income with comprehensive financial management features.

## Features

- **Expense Tracking**: Track both income and expenses with detailed information
- **Financial Summary**: View total income, expenses, and balance at a glance
- **Search Functionality**: Filter transactions by title or description with real-time search
- **Category Filtering**: Filter transactions by category using filter chips
- **Transaction Details**: Detailed view with full transaction information
- **Material 3 Design**: Modern UI following Material 3 design principles
- **Responsive Layout**: Works on different screen sizes
- **Visual Categories**: Color-coded categories with icons for easy identification

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── expense.dart         # Expense data model
├── data/
│   └── sample_expenses.dart # Sample expense data
├── screens/
│   ├── home_screen.dart     # Main expense listing screen
│   └── expense_detail_screen.dart # Expense detail view
└── widgets/
    ├── expense_card.dart    # Expense card widget
    ├── expense_summary.dart # Financial summary widget
    ├── custom_search_bar.dart # Search input widget
    └── category_chips.dart  # Category filter chips
```

## Prerequisites

- Flutter SDK (3.16.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Git

## Installation & Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd itemdcit104
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Add transaction data** (optional)
   - Modify sample data in `lib/data/sample_expenses.dart`
   - Add your own expense categories and transactions
   - The app includes comprehensive sample data for testing

## Running the App

### Development Mode

1. **Check Flutter installation**

   ```bash
   flutter doctor
   ```

2. **Run on connected device/emulator**

   ```bash
   # For mobile devices
   flutter run

   # For web
   flutter run -d chrome

   # For desktop
   flutter run -d windows  # Windows
   flutter run -d macos    # macOS
   flutter run -d linux    # Linux
   ```

3. **Hot reload during development**
   - Press `r` in the terminal for hot reload
   - Press `R` for hot restart

### Production Build

1. **Build for Web**

   ```bash
   flutter build web --release
   ```

   The built files will be in `build/web/`

2. **Build for Android**

   ```bash
   flutter build apk --release
   ```

   The APK will be in `build/app/outputs/flutter-apk/`

3. **Build for iOS**
   ```bash
   flutter build ios --release
   ```

## Deployment on Render

### Option 1: Using render.yaml (Recommended)

1. **Connect your repository to Render**

   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New +" → "Static Site"
   - Connect your Git repository

2. **Configure deployment**

   - Render will automatically detect the `render.yaml` configuration
   - The build command is: `flutter build web --release`
   - The publish directory is: `build/web`

3. **Deploy**
   - Click "Create Static Site"
   - Render will build and deploy your app automatically

### Option 2: Using Docker

1. **Build Docker image**

   ```bash
   docker build -t product-catalog .
   ```

2. **Run container locally**

   ```bash
   docker run -p 80:80 product-catalog
   ```

3. **Deploy to Render**
   - Create a new Web Service on Render
   - Connect your repository
   - Render will use the Dockerfile for deployment

## Configuration

### Environment Variables

- `FLUTTER_VERSION`: Flutter SDK version (default: 3.16.0)

### Customization

1. **Add more transactions**: Edit `lib/data/sample_expenses.dart`
2. **Modify categories**: Update the categories and their colors/icons
3. **Change theme**: Modify `lib/main.dart` theme configuration
4. **Add new features**: Extend the existing widgets and screens
5. **Add new expense types**: Extend the expense model and UI accordingly

## Development Tips

1. **Hot Reload**: Use `flutter run` and press `r` for quick iterations
2. **Debug Mode**: Use `flutter run --debug` for debugging
3. **Performance**: Use `flutter run --profile` for performance testing
4. **Linting**: Run `flutter analyze` to check code quality

## Troubleshooting

### Common Issues

1. **Flutter not found**

   ```bash
   # Add Flutter to PATH
   export PATH="$PATH:/path/to/flutter/bin"
   ```

2. **Dependencies issues**

   ```bash
   flutter clean
   flutter pub get
   ```

3. **Build failures**

   ```bash
   flutter doctor
   flutter clean
   flutter pub get
   flutter build web --release
   ```

4. **Web build issues**
   ```bash
   # Enable web support
   flutter config --enable-web
   flutter create --platforms web .
   ```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For issues and questions:

1. Check the troubleshooting section
2. Review Flutter documentation
3. Create an issue in the repository
