# Graphology_Flutter

Graphology App that contains an AI Model to analyze handwriting (Python - Flask API) with Flutter frontend.

## FLUTTER

### Installation Steps:

1. Create a new Flutter project.
   - For Windows: [Setup Guide](https://medium.com/@m.yuvaraj2303/flutter-programming-for-android-with-vscode-instead-of-using-android-studio-in-windows-af20f2d67e81)
   - For Mac: [Setup Guide](https://wahyu-ehs.medium.com/setup-flutter-on-mac-with-vscode-editor-3b9653773e85)

## Setup Instructions

1. **Create a New Flutter Project**
    ```sh
    flutter create student_hub
    cd student_hub
    ```

2. **Copy Files from the GitHub Repository**
    - Copy the files from the `lib` folder in the provided GitHub link into your project's `lib` folder.

3. **Update `pubspec.yaml`**
    - Compare the `pubspec.yaml` file from the provided GitHub link and update your `pubspec.yaml` with the necessary dependencies and configurations.

4. **Create Assets Folder**
    - In the root directory of the project, create an `assets` folder:
    ```sh
    mkdir assets
    ```
    add the files in the github link's assets folder to your assets folder

### Connecting to Firebase

6. **Integrate Firebase Using CLI**
    - Follow the instructions to integrate Firebase using the Firebase CLI:
    ```sh
    # Install Firebase CLI if you haven't already
    npm install -g firebase-tools

    # Login to Firebase
    firebase login

    # Choose the project in your firebase console
    flutterfire configure
    ```
   

## **Running the Project:**

   To run the Flutter project on your local machine or different platforms, follow these steps:

   - **Open the Project:**
     Navigate to the directory where your Flutter project is located using your terminal or command prompt. 

     For macOS:
     ```
     open -a simulator
     flutter run
     ```

   - **For Android/Windows:**

     If you're planning to run the project on an emulator or physical device, ensure that it is properly configured and connected to your development machine.

     - **For Android:**
       Open Android Studio and launch the Android Virtual Device (AVD) Manager to start an emulator then run command :
       ```
       flutter run
       ```

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
