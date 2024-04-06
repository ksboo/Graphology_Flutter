# Graphology_Flutter

Graphology App that contains an AI Model to analyze handwriting (Python - Flask API) with Flutter frontend.

## FLUTTER

### Installation Steps:

1. Create a new Flutter project.
   - For Windows: [Setup Guide](https://medium.com/@m.yuvaraj2303/flutter-programming-for-android-with-vscode-instead-of-using-android-studio-in-windows-af20f2d67e81)
   - For Mac: [Setup Guide](https://wahyu-ehs.medium.com/setup-flutter-on-mac-with-vscode-editor-3b9653773e85)

2. Add the given `lib` folder files into the `lib` folder.

3. Add dependencies mentioned in `pubspec.yaml` file:
   - Install the Pubspec Assist (VS Code Extension) if not already installed.
   - Open your project in Visual Studio Code.
   - Open `pubspec.yaml` file and add dependencies using Pubspec Assist.
   - Follow the instructions prompted by Pubspec Assist to add dependencies.

### Connecting to Firebase

Follow the instructions below to connect your Flutter project to Firebase using the FlutterFire CLI tool.

1. **Install FlutterFire CLI**:

          npm install -g flutterfire-cli

2. **Authenticate with Firebase**:

        firebase login

   
3. **Initialize Flutter Project**:
Navigate to your Flutter project directory in the terminal.

4. **Connect to Firebase**:

       flutterfire init


5. **Configure Firebase Services**:
- Configure Firebase services such as Authentication, Firestore, Realtime Database, etc., directly from the Firebase Console.

6. **Add Firebase Plugins**:

        flutterfire add <service>

Replace `<service>` with the name of the Firebase service you want to add.

7. **Initialize Firebase Services**:
- Initialize Firebase services in your Flutter project as per the documentation of each Firebase plugin.

8. **Verify Connection**:
- Run your Flutter app and check the console for any Firebase-related messages or errors.

## MODEL FLASK APP

### Setup Steps:

1. Create a separate folder with the content validation Python file.
2. Add your .h5 model to the folder.
3. Change the .h5 path in the Python file.
4. Run the server before running the Flutter app.

## Contributors

- Khushboo Shrivastava

## License

This project is licensed under the [MIT License](LICENSE).
